const int BUTTON_PIN = 10;
const int LED_PIN = 2;

int delay_time = 1000;
bool button_pressed = false;

void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  digitalWrite(LED_PIN, HIGH);

  if (digitalRead(BUTTON_PIN) == HIGH) { // check if clicked early
  }
  if (millis() >= ledStartTime) { // check if time to start
    lcd.clear();
    lcd.print("CLICK!");

    int resultTime = getClickTime();

    lcd.clear();
    lcd.print("YOUR TIME: ");
    lcd.setCursor(0, 1);
    lcd.print(resultTime);
    lcd.print("ms");
    reset();
  }
}
