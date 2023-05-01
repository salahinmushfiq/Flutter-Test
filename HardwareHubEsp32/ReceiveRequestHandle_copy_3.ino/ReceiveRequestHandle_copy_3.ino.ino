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

#define led1 32
// #define led2 33
// #define led3 25
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
  if (studentScanReqCheckFirebase()==true) {
      
        String studentId="";
        String scannedEquipmentID="";
        String requestEqID="";
        if (Firebase.RTDB.getInt(&firebaseDataRoot, "/requestType")) {
        
          Serial.println("requestType: ");
          Serial.println(firebaseDataRoot.to<int>());
          // if equipmentScanReq is true then open door and scan equipment then close door
          // else just open and close the door. and some delay for receiving the equipment in between
          if(firebaseDataRoot.intData()==0){
              Serial.println("requestType: Receive");
               if(studentId!=""){
                if(Firebase.RTDB.getInt(&firebaseDataRoot, "doorNo/")){
                    int doorNo=firebaseDataRoot.to<int>();
                    Serial.println("Fetched doorNo : ");
                    Serial.println(doorNo);  
                    if(doorNo==-1){
                      switch (doorNo) {
                        case 1:
                          //Open Close Door 0
                          rotateForward(1,pwm1);  
                          delay(3000); 
                          scannedEquipmentID=scanEquipment(rfidReader1);  
                          if(Firebase.RTDB.getString(&firebaseDataRoot, "requestEqID/")){
                           requestEqID=firebaseDataRoot.to<String>();
                            if(scanEquipment(rfidReader1)!=firebaseDataRoot.to<String>()){
                              rotateBackward(1,pwm1);  
                              break;          
                            }
                          }
                        case 2:
                          rotateForward(2,pwm2);  
                          delay(3000); 
                          scannedEquipmentID=scanEquipment(rfidReader2);  
                          if(Firebase.RTDB.getInt(&firebaseDataRoot, "requestEqID/")){
                            requestEqID=firebaseDataRoot.to<String>();
                            if(scannedEquipmentID!=requestEqID){
                              rotateBackward(2,pwm2);    
                              break;        
                            }
                          }
                        case 3:
                          //Open Close Door 3
                          scannedEquipmentID=scanEquipment(rfidReader2);  
                          if(Firebase.RTDB.getInt(&firebaseDataRoot, "requestEqID/")){
                            requestEqID=firebaseDataRoot.to<String>();
                            if(scannedEquipmentID!=requestEqID){
                              rotateBackward(2,pwm2);   
                              break;         
                            }
                          }
                        default:
                          // if nothing else matches, do the default
                          Serial.println("No such door exists");
                          break;
                      }                          
                    }
                  }
              }
            }  
          }
          if(firebaseDataRoot.intData()==1){
              Serial.println("requestType: Return");
              if(studentId!=""){
                if(Firebase.RTDB.getInt(&firebaseDataRoot, "doorNo/")){
                    int doorNo=firebaseDataRoot.to<int>();
                    Serial.println("Fetched doorNo : ");
                    Serial.println(doorNo);  
                    if(doorNo==-1){
                      switch (doorNo) {
                        case 1:
                          //Open Close Door 0
                          rotateForward(1,pwm1);  
                          delay(3000); 
                          scannedEquipmentID=scanEquipment(rfidReader1);  
                          if(Firebase.RTDB.getInt(&firebaseDataRoot, "requestEqID/")){
                           requestEqID=firebaseDataRoot.to<String>();
                            if(scannedEquipmentID==requestEqID){
                              rotateBackward(1,pwm1);    
                              break;        
                            }
                          }
                          break;
                        case 2:
                          rotateForward(2,pwm2);  
                          delay(3000); 
                          scannedEquipmentID=scanEquipment(rfidReader2);  
                          if(Firebase.RTDB.getInt(&firebaseDataRoot, "requestEqID/")){
                            requestEqID=firebaseDataRoot.to<String>();
                            if(scannedEquipmentID==requestEqID){
                              rotateBackward(2,pwm2);      
                              break;      
                            }
                          }
                          break;
                        case 3:
                          //Open Close Door 3
                          scannedEquipmentID=scanEquipment(rfidReader2);  
                          if(Firebase.RTDB.getInt(&firebaseDataRoot, "requestEqID/")){
                            requestEqID=firebaseDataRoot.to<String>();
                            if(scannedEquipmentID==requestEqID){
                              rotateBackward(2,pwm2);  
                              break;          
                            }
                          }
                          break;
                        default:
                          // if nothing else matches, do the default
                          Serial.println("No such door exists");
                          break;
                      }                          
                    }
                  }
              }
          }else{
              Serial.println("requestType: Not recognized");
          }
      
  }
  delay(500);
  
}
String readUIDRFID(MFRC522 rfidReader){
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
  return scannedID;
}
String scanEquipment(MFRC522 rfidReader){
  String scannedEquipmentID="";
  while(true){                    
      if (!rfidReader.PICC_IsNewCardPresent())
      {
        return scannedEquipmentID;
      }
      /*Select Card*/
      if (!rfidReader.PICC_ReadCardSerial())
      {
        return scannedEquipmentID;
      }
      //closing door
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
      return scannedEquipmentID;
  }
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
    Serial.print(" Degrees: ");   
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
    Serial.print(" Degrees: ");   
    Serial.println(posDegrees);
    delay(30);
  }
}
bool studentScanReqCheckFirebase(){
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