#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN = 10;
const int LED_PIN = 2;

long clickStartTime;
long timerStartTime;
long delayTime;

void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);

  lcd.init();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print("Press any button");
  lcd.setCursor(0, 1);
  lcd.print("to start..");

  reset();
}

void waitForClick() {
  while (true) {
    if (digitalRead(BUTTON_PIN) == LOW) {
      break;
    }
  }
  while (true) {
    if (digitalRead(BUTTON_PIN) == HIGH) {
      break;
    }
  }
  while (true) {
    if (digitalRead(BUTTON_PIN) == LOW) {
      break;
    }
  }
}

int getClickTime() {
  waitForClick();
  return millis() - clickStartTime;
}

void reset() {
  waitForClick();
  digitalWrite(LED_PIN, LOW);
  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  timerStartTime = millis();
  delayTime = random(1000, 3000);
}

void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) {
    lcd.clear();
    lcd.setCursor(0, 1);
    lcd.print("TOO EARLY       ");
    reset();
  }
  if (millis() >= timerStartTime + delayTime) {
    lcd.clear();
    lcd.print("CLICK!");
    clickStartTime = millis();
    digitalWrite(LED_PIN, HIGH);

    int result = getClickTime();

    lcd.clear();
    lcd.print("YOUR TIME: ");
    lcd.setCursor(0, 1);
    lcd.print(millis() - clickStartTime);
    lcd.print("ms");
    reset();
  }
}
