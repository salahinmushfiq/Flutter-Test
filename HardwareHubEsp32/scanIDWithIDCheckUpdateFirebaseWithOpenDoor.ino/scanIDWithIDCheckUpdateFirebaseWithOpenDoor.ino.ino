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

#define CS_1      2   /*Slave Select VS 21 Pin HS PIN 4*/
#define CS_2      4   /*Slave Select VS 21 Pin HS PIN 4*/
#define CS_3      5   /*Slave Select VS 21 Pin HS PIN 5*/
#define RST_PIN   16  /*Reset Pin for VS 22 RC522 HS PIN 16*/
#define MOSI_PIN  13  /*Slave Select VS 23 Pin HS PIN 13*/
#define MISO_PIN  12  /*Reset Pin for VS 19 RC522 HS PIN 12*/
#define SCK_PIN   14  /*Reset Pin for VS 18 RC522 HS PIN 14*/

// maximum and minimum number of "ticks" for the servo motors
// Range from 0 to 4095
// This determines the pulse width
#define SERVOMIN  80  // Minimum value
#define SERVOMAX  600  // Maximum value

//interfacing of servo driver to esp32 and external power 
// VCC,V+,VIN to battery + 
// SDA 21,SCL 22 
 
// Define servo motor connections (expand as required)
#define SER0  0   //Servo Motor 0 on connector 00
#define SER1  1   //Servo Motor 1 on connector 01
#define SER2  2   //Servo Motor 0 on connector 02
#define SER3  3   //Servo Motor 0 on connector 03
#define SER4  4   //Servo Motor 0 on connector 04
#define SER5  5   //Servo Motor 0 on connector 05

MFRC522 mfrc522(CS_1, RST_PIN);  // Create MFRC522 instance

String uidString;

//Define Firebase Data object
FirebaseData firebaseDataRoot;
FirebaseJsonData firebaseJsonDataRoot;

FirebaseAuth auth;
FirebaseConfig config;

 
//object to represent PCA9685 at default I2C address
Adafruit_PWMServoDriver pca9685 = Adafruit_PWMServoDriver(0x40);

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;


int pos = 0;                                      // variable to store the servo position

// Variables for Servo Motor positions (expand as required)
int pwm0;
int pwm1;
int pwm2;
int pwm3;
int pwm4;
int pwm5;
void setup(){
  Serial.begin(115200);
  while (!Serial) ;                                 // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
  
  SPI.begin(SCK_PIN, MISO_PIN, MOSI_PIN);
  mfrc522.PCD_Init();                               // Init MFRC522
  mfrc522.PCD_DumpVersionToSerial();                // Show details of PCD - MFRC522 Card Reader details
  wifiInit();                                       //establish wifi network
  firebaseInitWithSignup();                         //firebase Intitalize for read and write
  // Print to monitor
  Serial.println("PCA9685 Servo Test");
 
  // Initialize PCA9685
  pca9685.begin();

  // Set PWM Frequency to 50Hz
  pca9685.setPWMFreq(50);
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
void rotateForward(int SER,int pwm){
  // Move Motor 0 from 0 to 180 degrees
  for (int posDegrees = 0; posDegrees <= 90; posDegrees++) {
 
    // Determine PWM pulse width
    pwm = map(posDegrees, 0, 90, SERVOMIN, SERVOMAX);
    // Write to PCA9685
    pca9685.setPWM(SER, 0, pwm);
    // Print to serial monitor
    Serial.print("Motor 0 = ");
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
    Serial.print("Motor 0 = ");
    Serial.println(posDegrees);
    delay(30);
  }
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
        
        delay(5000);
        if (Firebase.RTDB.getInt(&firebaseDataRoot, "doorOpenReq")) {
          
          Firebase.RTDB.getInt(&firebaseDataRoot, "doorOpenReq");
          int doorNo=firebaseDataRoot.to<int>();
          Serial.println("DoorOpenReq: ");
          Serial.println(doorNo);
          
            if(doorNo!=-1){
              Serial.println("DoorOpenReq: ");
              Serial.println(doorNo);
              switch (doorNo) {
                case 0:
                  //do something when var equals 0
                  rotateForward(0,pwm0);  
                  delay(50000);
                  rotateBackward(0,pwm0); 
                  delay(10000);
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door 0 Open request and reset firebase data");                    
                  }
                  else{
                    Serial.println("door 0 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  }    
                  break;
                case 1:
                  //do something when var equals 2
                  rotateForward(1,pwm1);  
                  delay(50000);
                  rotateBackward(1,pwm1);   
                  delay(10000); 
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door 1 Open request and reset firebase data");                    
                  }
                  else{
                    Serial.println("door 1 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  }             
                  break;
                case 2:
                  //do something when var equals 2
                  rotateForward(2,pwm2);  
                  delay(50000);
                  rotateBackward(2,pwm2); 
                  delay(10000);    
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door 2 Open request and reset firebase data");                    
                  }
                  else{
                    Serial.println("door 2 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  }     
                  break;
                case 3:
                  //do something when var equals 2
                  rotateForward(3,pwm3);  
                  delay(50000);
                  rotateBackward(3,pwm3); 
                  delay(10000);
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door 3 Open request and reset firebase data");                    
                  }
                  else{
                    Serial.println("door 3 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  } 
                  break;
                case 4:
                  //do something when var equals 2
                  rotateForward(4,pwm4);  
                  delay(50000);
                  rotateBackward(4,pwm4); 
                  delay(10000);  
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door 4 Open request and reset firebase data");                    
                  }
                  else{
                    Serial.println("door 4 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  } 
                  break;    
                case 5:
                  //do something when var equals 2
                  rotateForward(5,pwm5);  
                  delay(50000);
                  rotateBackward(5,pwm5);  
                  delay(10000); 
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door 5 Open request and reset firebase data");                    
                  }
                  else{
                    Serial.println("door 5 OpenReq set failed because: " + firebaseDataRoot.errorReason());
                  }       
                  break;      
                default:
                  // if nothing else matches, do the default
                  Serial.println("Door No matched any given doors");
                  if(Firebase.RTDB.setInt(&firebaseDataRoot, "doorOpenReq",-1)){
                    Serial.println("Door Open request and reset firebase data");                    
                  }else{
                    Serial.println("doorOpenReq set failed because: " + firebaseDataRoot.errorReason());
                  }
                  break;
              }              
            }else{
                  Serial.println("Default value observed while making attempt on opening door.");
            }

        }else{
            Serial.println("DoorOpenReq Failed");
            Serial.println("REASON: " + firebaseDataRoot.errorReason());
        }
        
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
  
  Serial.println(F("Scan PICC to see UID, SAK, type, and data blocks..."));
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
  delay(10000); //delay for taking input. There can't be any other UID taken as input during the time
       
  if (Firebase.ready() && signupOK ){
      bool checkFlag=scanReqCheckFirebase(scannedID); 
      if(checkFlag==true){
        Serial.println("Sent to Firebase to write");
        firebaseWrite(scannedID);
      }
  }
  return ;
}