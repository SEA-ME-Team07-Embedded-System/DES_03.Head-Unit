#include <SPI.h>          //Library for using SPI Communication 
#include <mcp2515.h>      //Library for using CAN Communication (https://github.com/autowp/arduino-mcp2515/)
 
struct can_frame canMsg; //canMsg struct data type for storing CAN message format.
 
MCP2515 mcp2515(10); //set the pin number where SPI CS is connected.

const int TRIG_PIN = 5;
const int ECHO_PIN = 6;

int ultrasonic() {
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duration = pulseIn(ECHO_PIN, HIGH);

  int distance_cm = duration * 0.0343 / 2;
  Serial.print("Distance :");
  Serial.println(distance_cm);

  
  
  return distance_cm;
}

void setup() 
{
  canMsg.can_id  = 0x063;           //CAN id as 0x063
  canMsg.can_dlc = 8;               //CAN data length as 8
  canMsg.data[0] = 0x00;               
  canMsg.data[1] = 0x00;            
  canMsg.data[2] = 0x00;            //Rest all with 0
  canMsg.data[3] = 0x00;
  canMsg.data[4] = 0x00;
  canMsg.data[5] = 0x00;
  canMsg.data[6] = 0x00;
  canMsg.data[7] = 0x00;
  
  while (!Serial);
  Serial.begin(9600);

  pinMode(TRIG_PIN, OUTPUT); //Ultra sonic
  pinMode(ECHO_PIN, INPUT); //Ultra sonic

  mcp2515.reset();
  mcp2515.setBitrate(CAN_125KBPS, MCP_8MHZ); //Sets CAN at speed 125KBPS
  mcp2515.setNormalMode();

  Serial.println("Example: Write to CAN");

  delay(1000);
}
void loop() {

  //ultra sonic
  int d = ultrasonic();

  canMsg.data[2] = d;
  mcp2515.sendMessage(&canMsg);     //Sends the CAN message
  delay(500);
}