#include <SPI.h>
#include <MFRC522.h>

#define CS_1      2   /*Slave Select PIN VSPI 21 RC522 HSPI PIN 2*/
#define CS_2      4   /*Slave Select PIN VSPI 21 RC522 HSPI PIN 4*/
#define CS_3      5   /*Slave Select PIN VSPI 21 RC522 HSPI PIN 5*/
#define RST_PIN   16  /*Reset Pin        VSPI 22 RC522 HSPI PIN 16*/
#define MOSI_PIN  13  /*MOSI_PIN         VSPI 23 RC522 HSPI PIN 13*/
#define MISO_PIN  12  /*MISO_PIN         VSPI 19 RC522 HSPI PIN 12*/
#define SCK_PIN   14  /*CLock Pin        VSPI 18 RC522 HSPI PIN 14*/


MFRC522 rfidReader1(CS_1, RST_PIN);  // Create MFRC522 instance
MFRC522 rfidReader2(CS_2, RST_PIN);  // Create MFRC522 instance
MFRC522 rfidReader3(CS_3, RST_PIN);  // Create MFRC522 instance

int cardNo=1;
void setup() {
  // put your setup code here, to run once:
    // Serial monitor setup
  Serial.begin(115200);
  while (!Serial) ;  
  SPI.begin(SCK_PIN, MISO_PIN, MOSI_PIN);
  rfidReader1.PCD_Init(CS_1, RST_PIN);                 // Init rfidReader1
  rfidReader2.PCD_Init(CS_2, RST_PIN);                 // Init rfidReader2
  rfidReader3.PCD_Init(CS_3, RST_PIN);                 // Init rfidReader2

  
  digitalWrite(CS_1, LOW); // disable CS pin from peripheral 2
  digitalWrite(CS_2, HIGH); // enable CS pin to read from peripheral 1
  digitalWrite(CS_3, HIGH); // enable CS pin to read from peripheral 1
  Serial.println("RFID reader 1");
  rfidReader1.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details
  
  digitalWrite(CS_2, LOW); // enable CS pin to read from peripheral 1
  digitalWrite(CS_1, HIGH); // disable CS pin from peripheral 2
  digitalWrite(CS_3, HIGH); // enable CS pin to read from peripheral 1
  Serial.println("RFID reader 2");
  rfidReader2.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details

  digitalWrite(CS_3, LOW); // enable CS pin to read from peripheral 1
  digitalWrite(CS_1, HIGH); // disable CS pin from peripheral 2
  digitalWrite(CS_2, HIGH); // enable CS pin to read from peripheral 1
  Serial.println("RFID reader 3");
  rfidReader3.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details  
  Serial.println("");
  Serial.println("");
  Serial.println("");
}

void loop() {
  delay(5000);
  while (Serial.available() == 0) {}
  cardNo = Serial.parseInt(); //Reading the Input string from Serial port.
  delay(5000);
  /*Look for the RFID Card*/
  Serial.println(cardNo);
  switch(cardNo){
     case 1:
        Serial.println("Case 1");
        digitalWrite(CS_1, LOW); // enable CS pin to read from peripheral 1
        digitalWrite(CS_2, HIGH); // disable CS pin from peripheral 2
        digitalWrite(CS_3, HIGH); // disable CS pin from peripheral 3
        if( ! rfidReader1.PICC_IsNewCardPresent())
        {
          return;
        }
        /*Select Card*/
        if ( ! rfidReader1.PICC_ReadCardSerial())
        {
          return;
        }
        Serial.println("New Card in reader 1");
        readUIDRFID(rfidReader1);
        break;
     case 2:
        Serial.println("Case 2");
        digitalWrite(CS_2, LOW); //  enable CS pin to read from peripheral 1
        digitalWrite(CS_1, HIGH); // disable CS pin from peripheral 1
        digitalWrite(CS_3, HIGH); // disable CS pin from peripheral 3
        if( ! rfidReader2.PICC_IsNewCardPresent())
        {
          return;
        }
        /*Select Card*/
        if ( ! rfidReader2.PICC_ReadCardSerial())
        {
          return;
        }
        Serial.println("New Card in reader 2");
        readUIDRFID(rfidReader2);
        break;
     case 3:
        Serial.println("Case 3");
        digitalWrite(CS_3, LOW); // enable CS pin to read from peripheral 3
        digitalWrite(CS_1, HIGH); // disable CS pin from peripheral 1
        digitalWrite(CS_2, HIGH); // disable CS pin from peripheral 2
        if( ! rfidReader3.PICC_IsNewCardPresent())
        {
          return;
        }
        /*Select Card*/
        if ( ! rfidReader3.PICC_ReadCardSerial())
        {
          return;
        }
        Serial.println("New Card in reader 3");
        readUIDRFID(rfidReader3);
        break;
     default:
        if ( ! rfidReader1.PICC_IsNewCardPresent())
        {
          return;
        }
        /*Select Card*/
        if ( ! rfidReader1.PICC_ReadCardSerial())
        {
          return;
        }
        readUIDRFID(rfidReader1);
        break;                     
  }
  
}
void readUIDRFID(MFRC522 rfidReader){
  /*Show UID for Card/Tag on serial monitor*/
  Serial.print("UID tag :");
  String content= "";
  byte letter;
  for (byte i = 0; i < rfidReader.uid.size; i++)
  {
     Serial.print(rfidReader.uid.uidByte[i] < 0x10 ? " 0" : " ");
     Serial.print(rfidReader.uid.uidByte[i], HEX);
     content.concat(String(rfidReader.uid.uidByte[i] < 0x10 ? " 0" : " "));
     content.concat(String(rfidReader.uid.uidByte[i], HEX));
  }
  Serial.println();
  Serial.print("Message : ");
  content.toUpperCase();

}

  