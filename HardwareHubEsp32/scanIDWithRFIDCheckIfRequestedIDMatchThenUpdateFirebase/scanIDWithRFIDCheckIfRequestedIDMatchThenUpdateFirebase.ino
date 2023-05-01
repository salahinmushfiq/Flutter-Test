#include <WiFi.h>
#include <Firebase_ESP_Client.h>
//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"
#include <SPI.h>
#include <MFRC522.h>
#include <string.h> 
#include <cstring>
#include <Servo.h>
// Insert your network credentials
#define WIFI_SSID "maverick"
#define WIFI_PASSWORD "maverick4324184"

// Insert Firebase project API Key
#define API_KEY "AIzaSyDYBW8EEPXSbmGo9EXohckTgIYjtZlroQk"

// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "https://smartlab-d8086-default-rtdb.firebaseio.com/" 


#define SS_PIN    21  /*Slave Select Pin*/
#define RST_PIN   22  /*Reset Pin for RC522*/
#define MOSI_PIN  23  /*Slave Select Pin*/
#define MISO_PIN  19  /*Reset Pin for RC522*/
#define SCK_PIN  18  /*SCK Pin for RC522*/

MFRC522 mfrc522(SS_PIN, RST_PIN);  // Create MFRC522 instance
String uidString;

//Define Firebase Data object
FirebaseData firebaseDataRoot;
FirebaseJsonData firebaseJsonDataRoot;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;


int pos = 0;    // variable to store the servo position


void setup(){
  Serial.begin(115200);
  while (!Serial) ;                                 // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
  SPI.begin();                        // Init SPI bus
  mfrc522.PCD_Init();                 // Init MFRC522
  mfrc522.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details
  Serial.println(F("Scan PICC to see UID, SAK, type, and data blocks..."));
  wifiInit();
  firebaseInitWithSignup();

  
}

void loop(){
  /*Look for the RFID Card*/
  if ( ! mfrc522.PICC_IsNewCardPresent())
  {
    return;
  }
  /*Select Card*/
  if ( ! mfrc522.PICC_ReadCardSerial())
  {
    return;
  }
  readUID();

}
void firebaseInitWithSignup(void){
  /* Assign the api key (required) */
  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  /* Sign up */
  if (Firebase.signUp(&config, &auth, "", "")){
    Serial.println("ok");
    signupOK = true;
  }
  else{
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h
  
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);

}

void firebaseWrite(String scannedID){
    // Write an Float number on the database path test/float
    if (Firebase.RTDB.setString(&firebaseDataRoot, "currentScanID/",scannedID)){
      Serial.println("Scan ID PASSED");
      Serial.println("PATH: " + firebaseDataRoot.dataPath());
      Serial.println("TYPE: " + firebaseDataRoot.dataType());

      if(Firebase.RTDB.setBool(&firebaseDataRoot, "scanProcessed/",true)){
        Serial.println("scanProcessed & scanReq PASSED");
        Serial.println("PATH: " + firebaseDataRoot.dataPath());
        Serial.println("TYPE: " + firebaseDataRoot.dataType());
      }else{
        Serial.println("scanProcessed & scanReq Failed");
        Serial.println("REASON: " + firebaseDataRoot.errorReason());
      }
    }
    else {
      Serial.println("Scan ID Write FAILED");
      Serial.println("REASON: " + firebaseDataRoot.errorReason());
    }
   return;
}

bool scanReqCheckFirebase(String scannedID){
    bool flag=false;
    if (Firebase.RTDB.getBool(&firebaseDataRoot, "/scanReq")) {
       
        Serial.println("ScanReq: ");
        Serial.println(firebaseDataRoot.to<String>());
        if(firebaseDataRoot.boolData()==true){
          
          // if(Firebase.RTDB.getBool(&firebaseDataRoot, "/scanProcessed")){
          //   Serial.println("Scan Processed: ");
          //   Serial.println(firebaseDataRoot.to<String>());
          //    if(firebaseDataRoot.boolData()==false){            
                  Serial.println("Sending: ");
                  return true;
          //    }
          // }      
            
        }else{
          Serial.println("Scan Req: ");
          Serial.println(firebaseDataRoot.stringData());
        }
      } 
}
void wifiInit(void){

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  
}

void readUID(void){
  
  
  /*Show UID for Card/Tag on serial monitor*/
  Serial.print("UID tag :");
  String scannedID= "";
  byte letter;
  // mfrc522.PICC_DumpToSerial(&(mfrc522.uid));
  for (byte i = 0; i < mfrc522.uid.size; i++)
  {
     Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
     Serial.print(mfrc522.uid.uidByte[i], HEX);
     scannedID.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
     scannedID.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  Serial.println();
  Serial.print("Message : ");
  scannedID.toUpperCase();
  Serial.println(scannedID.substring(1));
  delay(5000); //delay for taking input. There can't be any other UID taken as input during the time
       
  if (Firebase.ready() && signupOK ){
      bool checkFlag=scanReqCheckFirebase(scannedID); 
      if(checkFlag==true){
        Serial.println("Sent to Firebase to write");
        firebaseWrite(scannedID);
      }
         
      // firebaseReadWaitingToBeSignedIn(scannedID);
      // firebaseWrite(scannedID);
  }

  
  return ;
}