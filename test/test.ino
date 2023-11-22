#define TINY_GSM_MODEM_SIM800
#define USE_ARDUINO_INTERRUPTS true  // Set-up low-level interrupts for most acurate BPM math.
#include <TinyGsmClient.h>
#include <ArduinoHttpClient.h>
#include <SoftwareSerial.h>
#include <PulseSensorPlayground.h>
#include <DFRobot_SIM808.h>
const int PulseWire = 0;  // A0
const int LED = LED_BUILTIN;
int Threshold = 550;
const char FIREBASE_HOST[] = "smartwheelchair-ccdba-default-rtdb.firebaseio.com";
const String FIREBASE_AUTH = "V2CXfYnGifsSXQC99qC196y1E8BIOdH2kxttKDlU";
const String FIREBASE_PATH = "/";
const int SSL_PORT = 443;

char apn[] = "v-internet";  // type your APN here
char user[] = "";
char pass[] = "";

SoftwareSerial sim808(7, 8);  // rx, tx... 7,8 (uno)
TinyGsm modem(sim808);
TinyGsmClientSecure gsm_client_secure_modem(modem, 0);
HttpClient http_client = HttpClient(gsm_client_secure_modem, FIREBASE_HOST, SSL_PORT);
DFRobot_SIM808 SIM808(&sim808);  // sim808 cho thu vien DFRobot

PulseSensorPlayground pulseSensor;
unsigned long previousMillis = 0;
int nhiptim, huyetap;
String state, thoigian, kinh_do, vi_do, vitri;
bool DEBUG = true;

void setup() {
  Serial.begin(9600);
  sim808.begin(9600);

  Serial.println("Starting...");
  while (!SIM808.init()) {
    delay(1000);
    Serial.print("Sim808 init error\r\n");
  }
  //************* Turn on the GPS power************

  /* pulseSensor.analogInput(PulseWire);
  pulseSensor.blinkOnPulse(LED);  //auto-magically blink Arduino's LED with heartbeat.
  pulseSensor.setThreshold(Threshold);

  if (pulseSensor.begin()) {
    Serial.println("Da tao 1 doi tuong do nhip tim! ");  //This prints one time at Arduino power-up,  or on Arduino reset.
  } */

  Serial.println("\nInitializing modem...");
  modem.restart();
  Serial.print("Modem: ");
  Serial.println(modem.getModemInfo());
  http_client.setHttpResponseTimeout(10000);  //^0 secs timeout
}

void loop() {
  Serial.print(F("Connecting to "));
  Serial.print(apn);
  if (!modem.gprsConnect(apn, user, pass)) {
    Serial.println(" fail");
    delay(1000);
    return;
  }
  Serial.println(" OK");

  http_client.connect(FIREBASE_HOST, SSL_PORT);

  while (true) {
    if (!http_client.connected()) {
      Serial.println();
      http_client.stop();  // Shutdown
      Serial.println("HTTP  not connect");
      break;
    } else {
      /* if (SIM808.attachGPS()) {  // bat gps
        Serial.println("Open the GPS power success");
      } else {
        Serial.println("Open the GPS power failure");
      } 
      if (SIM808.getGPS()) {
        if (SIM808.getGPS()) {
          float kinhdo = SIM808.GPSdata.lat;
          float vido = SIM808.GPSdata.lon;
          char kinh_do_str[10];  // Để lưu trữ chuỗi kinh_do
          char vi_do_str[10];    //

          dtostrf(kinhdo, 9, 6, kinh_do_str);  // Chuyển đổi kinh_do thành chuỗi với 6 số thập phân
          dtostrf(vido, 9, 6, vi_do_str);      // Chuyển đổi vi_do thành chuỗi với 6 số thập phân

          String vitri = "https://www.google.com/maps?q=loc:" + String(kinh_do_str) + ',' + String(vi_do_str);
          Serial.println(vitri);
        }
        SIM808.detachGPS();
        */
      nhiptim = 100;
      huyetap = random(80, 130);
      Serial.println("nhiptim: " + String(nhiptim));
      Serial.println("huyetap: " + String(huyetap));
      SetFirebase(vitri, String(nhiptim), String(huyetap), &http_client);  // qua test thì delay khoảng 4s
      //GetFirebase("PATCH", FIREBASE_PATH, &http_client);
    }
  }
}
void SetFirebase(const String& vi_tri, const String& nhip_tim, const String& huyet_ap, HttpClient* http) {
  http->connectionKeepAlive();  // Cần thiết khi sử dụng HTTPS

  String url = "/" + FIREBASE_PATH + ".json";
  url += "?auth=" + FIREBASE_AUTH;

  String firebaseData = "{\"vitri\": \"" + vi_tri + "\", \"nhip tim\": \"" + nhip_tim + "\", \"huyet ap\": \"" + huyet_ap + "\"}";

  http->patch(url, "application/json", firebaseData);

  int statusCode = http->responseStatusCode();
  String response = http->responseBody();

  Serial.print("Status code: ");
  Serial.println(statusCode);

  //http->stop();  // Đóng kết nối HTTP
}


void GetFirebase(const char* method, const String& path, HttpClient* http) {
  String response;
  int statusCode = 0;
  http->connectionKeepAlive();  // Currently, this is needed for HTTPS

  String url;
  if (path[0] != '/') {
    url = "/";
  }
  url += path + ".json";
  url += "?auth=" + FIREBASE_AUTH;

  http->get(url);

  response = http->responseBody();

  Serial.print("Response: ");
  Serial.println(response);

  if (!http->connected()) {
    Serial.println();
    http->stop();  // Shutdown
    Serial.println("HTTP POST disconnected");
  }
}
/* 
int do_nhiptim() {
  int myBPM;
  if (pulseSensor.sawStartOfBeat()) {              // Constantly test to see if "a beat happened".
    myBPM = pulseSensor.getBeatsPerMinute();   // Calls function on our pulseSensor object that returns BPM as an "int".
                                                   // "myBPM" hold this BPM value now.
    Serial.println("♥  A HeartBeat Happened ! ");  // If test is "true", print a message "a heartbeat happened".
    Serial.print("BPM: ");                         // Print phrase "BPM: "
    Serial.println(myBPM);                         // Print the value inside of myBPM.
  }

  delay(20);  // considered best practice in a simple sketch.
  return myBPM;
} */


void call(void) {
  sendData("AT+CSQ", 1000, DEBUG);
  sendData("ATD0384474806;", 1000, DEBUG);
  delay(15000);
  sendData("ATH", 1000, DEBUG);
}

void sendSMS(void) {
  sim808.println();
  sim808.println("AT+CMGF=1");  // Sets the SMS mode to text
  delay(100);
  sim808.println();
  sim808.print("AT+CMGS=");  // Send the SMS number. To whome message to send.
  sim808.print("\"+84384474806\"");
  sim808.println();
  delay(100);
  sim808.print("Vi tri cua ban: ");
  sim808.print("http://maps.google.com/maps?q=loc:");
  sim808.print(kinh_do);
  sim808.print(",");
  sim808.print(vi_do);
  sim808.println();
  sim808.println("Thoi gian thuc: " + thoigian);
  sim808.write(26);  //CTRL+Z key combination to send message
  delay(200);
  sim808.println();
  sim808.flush();
  sim808.println("GPS Location sent! Check your mobile phone…");
}


String sendData(String command, const int timeout, boolean debug) {
  String response = "";
  sim808.println(command);
  long int time = millis();
  while ((time + timeout) > millis()) {
    while (sim808.available()) {
      char c = sim808.read();
      response += c;
    }
  }
  if (debug) {
    Serial.print(response);
  }
  //kq = response;
  return response;
}