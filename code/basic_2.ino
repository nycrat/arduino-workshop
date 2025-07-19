const int LED_A_PIN = 12;
const int LED_B_PIN = 13;
const int BUTTON_A_PIN = 4;
const int BUTTON_B_PIN = 5;

void setup() {
  pinMode(LED_A_PIN, OUTPUT);
  pinMode(LED_B_PIN, OUTPUT);
  pinMode(BUTTON_A_PIN, INPUT);
  pinMode(BUTTON_B_PIN, INPUT);
}

void loop() {
  bool a = digitalRead(BUTTON_A_PIN) == HIGH;
  bool b = digitalRead(BUTTON_B_PIN) == HIGH;

  if (a && b) {
    digitalWrite(LED_A_PIN, HIGH);
    digitalWrite(LED_B_PIN, LOW);
    delay(50);
    digitalWrite(LED_A_PIN, LOW);
    digitalWrite(LED_B_PIN, HIGH);
    delay(50);
  } else if (a) {
    digitalWrite(LED_A_PIN, HIGH);
    delay(50);
    digitalWrite(LED_A_PIN, LOW);
    delay(50);
  } else if (b) {
    digitalWrite(LED_B_PIN, HIGH);
    delay(50);
    digitalWrite(LED_B_PIN, LOW);
    delay(50);
  }

  digitalWrite(LED_A_PIN, LOW);
  digitalWrite(LED_B_PIN, LOW);
}
