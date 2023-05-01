#include <WiFi.h>
#include <Firebase_ESP_Client.h>
//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"
#include <string.h> 
// Insert your network credentials
#define WIFI_SSID "maverick"
#define WIFI_PASSWORD "maverick4324184"


// Insert Firebase project API Key
#define API_KEY "AIzaSyDYBW8EEPXSbmGo9EXohckTgIYjtZlroQk"

// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "https://smartlab-d8086-default-rtdb.firebaseio.com/" 


#include <cstring>
#include <SPI.h>
#include <MFRC522.h>
#include <Servo.h>
// Wire Library for I2C
#include <Wire.h>
//Adafruit PCA9685 Servo Library
#include <Adafruit_PWMServoDriver.h>


//Define Firebase Data object
FirebaseData firebaseDataRoot;
FirebaseJsonData firebaseJsonDataRoot;
FirebaseAuth auth;
FirebaseConfig config;
unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;


#define CS_1      2   /*Slave Select VS 21 Pin HS PIN 4*/
#define CS_2      4   /*Slave Select VS 21 Pin HS PIN 4*/
#define CS_3      5   /*Slave Select VS 21 Pin HS PIN 5*/
#define RST_PIN   16  /*Reset Pin for VS 22 RC522 HS PIN 16*/
#define MOSI_PIN  13  /*Slave Select VS 23 Pin HS PIN 13*/
#define MISO_PIN  12  /*Reset Pin for VS 19 RC522 HS PIN 12*/
#define SCK_PIN   14  /*Reset Pin for VS 18 RC522 HS PIN 14*/


MFRC522 rfidReader1(CS_1, RST_PIN);  // Create MFRC522 instance
MFRC522 rfidReader2(CS_2, RST_PIN);  // Create MFRC522 instance
MFRC522 rfidReader3(CS_3, RST_PIN);  // Create MFRC522 instance

int cardNo=1;
//object to represent PCA9685 at default I2C address
Adafruit_PWMServoDriver pca9685 = Adafruit_PWMServoDriver(0x40);
// maximum and minimum number of "ticks" for the servo motors
// Range from 0 to 4095
// This determines the pulse width
 
#define SERVOMIN  80 // Minimum value
#define SERVOMAX  600  // Maximum value
// VCC,V+,VIN to battery + 
// SDA 21,SCL 22 

// Variables for Servo Motor positions (expand as required)
int pwm0;
int pwm1;
int pwm2;
int pwm3;
int pwm4;
int pwm5;
int pwm6;

void setup() {
  Serial.begin(115200);
  while (!Serial) ;                                 // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
  // put your setup code here, to run once:
  wifiInit();                                         //establish wifi network
  firebaseInitWithSignup();                         //firebase Intitalize for read and write
  SPI.begin(SCK_PIN, MISO_PIN, MOSI_PIN);
  rfidReader1.PCD_Init(CS_1, RST_PIN);                 // Init rfidReader1
  rfidReader2.PCD_Init(CS_2, RST_PIN);                 // Init rfidReader2
  rfidReader3.PCD_Init(CS_3, RST_PIN);                 // Init rfidReader2
                                       //establish wifi network
  Serial.println("RFID reader 1");
  rfidReader1.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details
  Serial.println("RFID reader 2");
  rfidReader2.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details
  Serial.println("RFID reader 3");
  rfidReader3.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details  
  Serial.println("");
  Serial.println("");
                        
  
  // Print to monitor
  Serial.println("PCA9685 Servo Test");
 
  // Initialize PCA9685
  pca9685.begin();

  // Set PWM Frequency to 50Hz
  pca9685.setPWMFreq(50);

  
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

void loop() {
   // put your main code here, to run repeatedly:
  /*Look for the RFID Card*/
  if ( ! rfidReader3.PICC_IsNewCardPresent())
  {
    return;
  }
  /*Select Card*/
  if ( ! rfidReader3.PICC_ReadCardSerial())
  {
    return;
  }
  readUIDRFID(rfidReader3); 
  
}
void readUIDRFID(MFRC522 rfidReader){
  /*Show UID for Card/Tag on serial monitor*/
  Serial.print("UID tag :");
  String scannedID= "";
  byte letter;
  for (byte i = 0; i < rfidReader.uid.size; i++)
  {
     Serial.print(rfidReader.uid.uidByte[i] < 0x10 ? " 0" : " ");
     Serial.print(rfidReader.uid.uidByte[i], HEX);
     scannedID.concat(String(rfidReader.uid.uidByte[i] < 0x10 ? " 0" : " "));
     scannedID.concat(String(rfidReader.uid.uidByte[i], HEX));
  }
  Serial.println();
  Serial.print("StudentID : ");
  scannedID.toUpperCase();

  if (Firebase.ready() && signupOK ){
      bool checkFlag=studentScanReqCheckFirebase(scannedID); 
      Serial.print("Check Flag: ");
      Serial.println(checkFlag);
      if(checkFlag==true){
        Serial.println("Sent scannedID to Firebase to write");
        setCurrentScanIDOpenDoor(scannedID);
      }
  }

}
void scanEquipment(MFRC522 rfidReader){
  while(true){                    
      if (!rfidReader.PICC_IsNewCardPresent())
      {
        return;
      }
      /*Select Card*/
      if (!rfidReader.PICC_ReadCardSerial())
      {
        return;
      }
      //closing door
      scanAndWriteToFirebaseEquipmentID(rfidReader);
      break;
  }
}
void openCloseDoors(int doorNo){
    
      Serial.println("doorNo: ");
      Serial.println(doorNo);
      switch (doorNo) {
        case 0:
          //Open Close Door 0
          rotateForward(0,pwm0);  
          delay(3000); 
          if (Firebase.RTDB.getBool(&firebaseDataRoot, "/equipmentIdScanReqFlag")) {
        
            Serial.println("Equipment Id ScanReq Flag: ");
            Serial.println(firebaseDataRoot.to<String>());
            // if equipmentScanReq is true then open door and scan equipment then close door
            // else just open and close the door. and some delay for receiving the equipment in between
            if(firebaseDataRoot.boolData()==true){
                scanEquipment(rfidReader1);
                delay(5000);     
                rotateBackward(0,pwm0); 
                delay(3000); 
                if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
                  Serial.println("Door 0 Open request and reset firebase data");
                  break;                    
                }
                else{
                  Serial.println("door 0 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  break;
                }      
            }else{
                delay(5000);  
                rotateBackward(0,pwm0);  
                if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
                  Serial.println("Door 0 Open request and reset firebase data");  
                  break;                  
                }
                else{
                  Serial.println("door 0 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  break;
                }  
            }  
          }else{
            Serial.println("Equipment Id ScanReq Flag fetch error: ");
            break;
          }
        case 1:
          rotateForward(0,pwm0);  
          delay(3000); 
            if (Firebase.RTDB.getBool(&firebaseDataRoot, "/equipmentIdScanReqFlag")) {
        
            Serial.println("Equipment Id ScanReq Flag: ");
            Serial.println(firebaseDataRoot.to<String>());
            // if equipmentScanReq is true then open door and scan equipment then close door
            // else just open and close the door. and some delay for receiving the equipment in between
            if(firebaseDataRoot.boolData()==true){
                scanEquipment(rfidReader2);
                delay(5000);     
                rotateBackward(1,pwm1); 
                delay(3000); 
                if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
                  Serial.println("Door 1 Open request and reset firebase data");
                  Firebase.RTDB.setBool(&firebaseDataRoot, "/equipmentIdScanReqFlag",false);
                  break;                    
                }
                else{
                  Serial.println("door 1 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  break;
                }      
            }else{
                delay(5000);  
                rotateBackward(1,pwm1);  
                if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
                  Serial.println("Door 1 Open request and reset firebase data");  
                  break;                  
                }
                else{
                  Serial.println("door 1 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  break;
                }  
            }  
          }else{
            Serial.println("Equipment Id ScanReq Flag fetch error: ");
            break;
          }
        case 2:
          //Open Close Door 2
          rotateForward(2,pwm2);  
          delay(3000); 
          rotateBackward(2,pwm2); 
          delay(3000);   
          if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
            Serial.println("Door 2 Open request and reset firebase data");                    
          }
          else{
            Serial.println("door 2 OpenReq set failed because: " + firebaseDataRoot.errorReason());
          }     
          break;
        case 3:
          //Open Close Door 6
          rotateForward(3,pwm3);  
          delay(3000); 
          rotateBackward(3,pwm3); 
          delay(3000); 
          if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
            Serial.println("Door 3 Open request and reset firebase data");                    
          }
          else{
            Serial.println("door 3 OpenReq set failed because: " + firebaseDataRoot.errorReason());
          } 
          break;
        case 4:
          //Open Close Door 4
          rotateForward(4,pwm4);  
          delay(50000);
          rotateBackward(4,pwm4); 
          delay(10000);  
          if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
            Serial.println("Door 4 Open request and reset firebase data");                    
          }
          else{
            Serial.println("door 4 OpenReq set failed because: " + firebaseDataRoot.errorReason());
          } 
          break;    
        case 5:
          //Open Close Door 5
          rotateForward(5,pwm5);  
          delay(50000);
          rotateBackward(5,pwm5);  
          delay(10000); 
          if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorNo",-1)){
            Serial.println("Door 5 Open request and reset firebase data");                    
          }
          else{
            Serial.println("door 5 OpenReq set failed because: " + firebaseDataRoot.errorReason());
          }       
          break;      
        default:
          // if nothing else matches, do the default
          Serial.println("No such door exists");
          break;
        }              
      
};
void setCurrentScanIDOpenDoor(String scannedID){
    // Write an Float number on the database path test/float
    if (Firebase.RTDB.setString(&firebaseDataRoot, "currentStudentScanID/",scannedID)){
      Serial.println("Student Scan ID PASSED");
      Serial.println("PATH: " + firebaseDataRoot.dataPath());
      Serial.println("TYPE: " + firebaseDataRoot.dataType());

      if(Firebase.RTDB.setBool(&firebaseDataRoot, "scanProcessed/",true)){
        Serial.println("scanProcessed & scanReq PASSED");
        Serial.println("PATH: " + firebaseDataRoot.dataPath());
        Serial.println("TYPE: " + firebaseDataRoot.dataType());

        if (Firebase.RTDB.getInt(&firebaseDataRoot, "doorNo/")) {
          
          int doorNo=-1;
          int scanLimit=3;                
          while(doorNo==-1 || scanLimit==0){
            Firebase.RTDB.getInt(&firebaseDataRoot, "doorNo/");
            doorNo=firebaseDataRoot.to<int>();
            Serial.println("Fetched doorNo : ");
            Serial.println(doorNo);
            // delay(5000);
            scanLimit--;
            openCloseDoors(doorNo);
                    
          } 
          Serial.println("Door opening failed.");
          

        }else{
            Serial.println("doorNo Failed");
            Serial.println("REASON: " + firebaseDataRoot.errorReason());
        }
        
      }else{
        Serial.println("scanProcessed & scanReq Failed");
        Serial.println("REASON: " + firebaseDataRoot.errorReason());
      }
    }
    else {
      Serial.println("Student Scan ID Write FAILED");
      Serial.println("REASON: " + firebaseDataRoot.errorReason());
    }
   return;
}
void rotateForward(int SER,int pwm){
 // Move Motor 0 from 0 to 180 degrees
  for (int posDegrees = 0; posDegrees <= 90; posDegrees++) {
 
    // Determine PWM pulse width
    pwm = map(posDegrees, 0, 90, SERVOMIN, SERVOMAX);
    // Write to PCA9685
    pca9685.setPWM(SER, 0, pwm);
    // Print to serial monitor
    Serial.print("Motor: ");
    Serial.print(SER); 
    Serial.print("Degrees: ");   
    Serial.println(posDegrees);
    delay(30);
  }
}
void rotateBackward(int SER,int pwm){
  // Move Motor 0 from 180 to 0 degrees
  for (int posDegrees = 90; posDegrees >= 0; posDegrees--) {
 
    // Determine PWM pulse width
    pwm = map(posDegrees, 0, 90, SERVOMIN, SERVOMAX);
    // Write to PCA9685
    pca9685.setPWM(SER, 0, pwm);
    // Print to serial monitor
    Serial.print("Motor: ");
    Serial.print(SER); 
    Serial.print("Degrees: ");   
    Serial.println(posDegrees);
    delay(30);
  }
}
bool studentScanReqCheckFirebase(String scannedID){
    bool flag=false;
    if (Firebase.RTDB.getBool(&firebaseDataRoot, "/studentIdScanReqFlag")) {
       
        Serial.println("student Id Scan Req Flag: ");
        Serial.println(firebaseDataRoot.to<String>());
        if(firebaseDataRoot.boolData()==true){
          
          // if(Firebase.RTDB.getBool(&firebaseDataRoot, "/scanProcessed")){
          //   Serial.println("Scan Processed: ");
          //   Serial.println(firebaseDataRoot.to<String>());
          //    if(firebaseDataRoot.boolData()==false){            
                  Serial.println("Sending: ");
                  flag= true;
                  return flag;
          //    }
          // }      
            
        }else{
          Serial.println("Student IdScan Req Flag: ");
          Serial.println(firebaseDataRoot.stringData());
          return flag;
        }
      }else{
        return flag;
      } 
}
bool equipmentScanReqCheckFirebase(String scannedID){
    bool flag=false;
    if (Firebase.RTDB.getBool(&firebaseDataRoot, "/equipmentIdScanReqFlag")) {
       
        Serial.println("equipmentIdScanReqFlag: ");
        Serial.println(firebaseDataRoot.to<String>());
        if(firebaseDataRoot.boolData()==true){
          
          // if(Firebase.RTDB.getBool(&firebaseDataRoot, "/scanProcessed")){
          //   Serial.println("Scan Processed: ");
          //   Serial.println(firebaseDataRoot.to<String>());
          //    if(firebaseDataRoot.boolData()==false){            
                  Serial.println("Sending: ");
                  flag= true;
                  return flag;
          //    }
          // }      
            
        }else{
          Serial.println("equipmentIdScanReqFlag: ");
          Serial.println(firebaseDataRoot.stringData());
          return flag;
        }
    }else{
      return flag;
    } 
}
void scanAndWriteToFirebaseEquipmentID(MFRC522 rfidReader){
  /*Show UID for Card/Tag on serial monitor*/
  Serial.print("UID tag :");
  String scannedEquipmentID= "";
  byte letter;
  bool hasValue=false;
  for (byte i = 0; i < rfidReader.uid.size; i++)
  {
     Serial.print(rfidReader.uid.uidByte[i] < 0x10 ? " 0" : " ");
     Serial.print(rfidReader.uid.uidByte[i], HEX);
     scannedEquipmentID.concat(String(rfidReader.uid.uidByte[i] < 0x10 ? " 0" : " "));
     scannedEquipmentID.concat(String(rfidReader.uid.uidByte[i], HEX));
  }
  Serial.println();
  Serial.print("Equipment ID : ");
  scannedEquipmentID.toUpperCase();
  if (Firebase.ready() && signupOK ){
      bool checkFlag=equipmentScanReqCheckFirebase(scannedEquipmentID); 
      if(checkFlag==true){
        Serial.println("Sent to Firebase to write");
        // firebaseWrite(scannedID);
        if (Firebase.RTDB.setString(&firebaseDataRoot, "requestEqID/",scannedEquipmentID)){
            Serial.println("Scanned Equipment ID PASSED");
            Serial.println("PATH: " + firebaseDataRoot.dataPath());
            Serial.println("TYPE: " + firebaseDataRoot.dataType());
        }
      }
  }

}