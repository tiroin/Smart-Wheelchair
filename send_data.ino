#define TINY_GSM_MODEM_SIM800
#include <TinyGsmClient.h>      
#include <ArduinoHttpClient.h>  
#include <SoftwareSerial.h>

int sensorPin = A0;  // Chân analog kết nối với chân OUT của cảm biến
int sampleWindow = 500;  // số lượng giá trị đọc
unsigned int sample;

//const char FIREBASE_HOST[] = "smartwheelchair-ccdba-default-rtdb.firebaseio.com/users/Stcws1rs4NW0bokmuOEU6z8BUqW2";
const char FIREBASE_HOST[] = "smartwheelchair-ccdba-default-rtdb.firebaseio.com";

const String FIREBASE_AUTH = "V2CXfYnGifsSXQC99qC196y1E8BIOdH2kxttKDlU";
const String FIREBASE_PATH = "/";
const int SSL_PORT = 443;
                              
SoftwareSerial sim800(7, 8);    // noi vs chan tx, rx module sim
TinyGsm modem(sim800);
TinyGsmClientSecure gsm_client_secure_modem(modem, 0);
HttpClient http_client = HttpClient(gsm_client_secure_modem, FIREBASE_HOST, SSL_PORT);

char apn[] = "v-internet";  // type your APN here
char user[] = "";
char pass[] = "";

unsigned long previousMillis = 0;
int nhiptim, huyetap;
String kinh_do="16.074562", vi_do="108.215874";

bool DEBUG;

void setup() {
  Serial.begin(9600);
  sim800.begin(9600);
  
  Serial.println("\nInitializing modem...");
  modem.restart();
  String modemInfo = modem.getModemInfo();
  Serial.print("Modem: ");
  Serial.println(modemInfo);
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
    } 
    else {
      nhiptim = get_BPM();        // Dữ liệu JSON bạn muốn gửi lên Firebase
      huyetap = random(80, 130);
      String vitri = "http://maps.google.com/maps?q=loc:" + kinh_do + ',' + vi_do;
      Serial.println("nhiptim: "+ String(nhiptim));
      Serial.println("huyetap: "+ String(huyetap));
      SetFirebase( vitri, String(nhiptim), String(huyetap),  &http_client);    // qua test thì delay khoảng 4s
      //GetFirebase("PATCH", FIREBASE_PATH, &http_client);
    }
    if(get_BPM() < 70 or get_BPM() > 100)
    {
      sendSMS();
      //call();
    }
  }
}

void SetFirebase(const String& vi_tri, const String& nhip_tim, const String& huyet_ap, HttpClient* http) {
  http->connectionKeepAlive();  // Cần thiết khi sử dụng HTTPS

  String url = "/users" + FIREBASE_PATH  + ".json";    // gui lenh nhanh user 
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

int get_BPM()
{
  unsigned long startMillis = millis();  // Thời gian bắt đầu mẫu
  unsigned int sensorValue = 0;
  unsigned long sum = 0;

  for (int i = 0; i < sampleWindow; i++) {
    sensorValue = analogRead(sensorPin);
    sum += sensorValue;
    delay(1);
  }
  sample = sum / sampleWindow;  // Giá trị trung bình của các mẫu
  /* Serial.println(sample);
  delay(10); */
  // Chuyển đổi giá trị đọc thành nhịp tim
  int nhiptim = map(sample, 0, 1023, 0, 200);
 
  Serial.print("Nhịp tim: ");
  Serial.println(nhiptim); 

  unsigned long endMillis = millis();  // Thời gian kết thúc mẫu
  unsigned long duration = endMillis - startMillis;  // Thời gian mẫu (ms)
  
  // Đảm bảo mẫu được lấy mỗi giây
  if (duration < 1000) {
    delay(1000 - duration);
  }
  return nhiptim;
}

void call(void) {
  sendData("AT+CSQ", 1000, DEBUG);
  sendData("ATD0384474806;", 1000, DEBUG);
  delay(15000);
  sendData("ATH", 1000, DEBUG);
}

void sendSMS(void) {
  //getGPS();
  sim800.println();
  sim800.println("AT+CMGF=1");  // Sets the SMS mode to text
  delay(100);
  sim800.println();
  sim800.print("AT+CMGS=");  // Send the SMS number. To whome message to send.
  sim800.print("\"+84384474806\"");
  sim800.println();
  delay(100);
  sim800.print("WARNING!!! Nhip tim khong binh thuong.");
  sim800.println();
  sim800.print("Vi tri cua ban: ");
  sim800.print("http://maps.google.com/maps?q=loc:");
  sim800.print(kinh_do);
  sim800.print(",");
  sim800.print(vi_do);
  sim800.println();
  
  //sim800.println("Thoi gian thuc: " + thoigian);
  sim800.write(26);  //CTRL+Z key combination to send message
  delay(200);
  sim800.println();
  sim800.flush();
  sim800.println("GPS Location sent! Check your mobile phone…");
}


String sendData(String command, const int timeout, boolean debug) {
  String response = "";
  sim800.println(command);
  long int time = millis();
  while ((time + timeout) > millis()) {
    while (sim800.available()) {
      char c = sim800.read();
      response += c;
    }
  }
  if (debug) {
    Serial.print(response);
  }
  //kq = response;
  return response;
}
