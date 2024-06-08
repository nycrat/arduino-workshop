#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN = 10;
const int LED_PIN = 2;

long ledStartTime; // stores start time of LED turning on

void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);

  lcd.init();
  lcd.backlight();
  lcd.print("Press button");
  lcd.setCursor(0, 1);
  lcd.print("to start..");

  reset();
}
void waitForClick() {
  // wait for button release
  while (true) {
    if (digitalRead(BUTTON_PIN) == LOW) {
      break;
    }
  }
  // wait for button down
  while (true) {
    if (digitalRead(BUTTON_PIN) == HIGH) {
      break;
    }
  }
  // wait for button release
  while (true) {
    if (digitalRead(BUTTON_PIN) == LOW) {
      break;
    }
  }
}
void reset() {
  waitForClick(); // click to reset

  digitalWrite(LED_PIN, LOW);
  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  ledStartTime = millis() + random(1000, 3000);
}

int getClickTime() {
  waitForClick();
  return millis() - ledStartTime;
}
void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) { // check if clicked early
    lcd.clear();
    lcd.print("TOO EARLY");
    reset();
  }
  if (millis() >= ledStartTime) { // check if time to start
    lcd.clear();
    lcd.print("CLICK!");
    digitalWrite(LED_PIN, HIGH);

    int resultTime = getClickTime();

    lcd.clear();
    lcd.print("YOUR TIME: ");
    lcd.setCursor(0, 1);
    lcd.print(resultTime);
    lcd.print("ms");
    reset();
  }
}
