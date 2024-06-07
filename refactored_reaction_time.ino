#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN = 10;

long click_start_time = -1;
long timer_start_time = 0;
long delay_time = random(1000, 3000);

void setup() {
  lcd.init();
  lcd.backlight();
  lcd.setCursor(0,0);
  lcd.print("WAIT FOR LIGHT!");

  pinMode(BUTTON_PIN, INPUT);
  timer_start_time = millis();
}

void waitForButton() {
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
  waitForButton();
  return millis() - click_start_time;
}

void reset() {
  waitForButton();
  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  timer_start_time = millis();
  delay_time = random(1000, 3000);
}

void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) {
    lcd.clear();
    lcd.setCursor(0, 1);
    lcd.print("TOO EARLY       ");
    reset();
  }
  if (millis() >= timer_start_time + delay_time) {
    lcd.clear();
    lcd.print("CLICK!");
    click_start_time = millis();

    int result = getClickTime();

    lcd.clear();
    lcd.print("YOUR TIME: ");
    lcd.setCursor(0, 1);
    lcd.print(millis() - click_start_time);
    lcd.print("ms");
    reset();
  }
}
