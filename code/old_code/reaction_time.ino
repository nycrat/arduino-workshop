#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN = 10;

long click_start_time = -1;
long timer_start_time = 0;
long delay_time = random(1000, 3000);
bool button_pressed = false;

void setup() {
  lcd.init();
  lcd.backlight();
  lcd.setCursor(0,0);
  lcd.print("WAIT FOR LIGHT!");

  pinMode(BUTTON_PIN, INPUT);
  timer_start_time = millis();
}

void waitForButton() {
  while (digitalRead(BUTTON_PIN) == HIGH) {}
  while (digitalRead(BUTTON_PIN) == LOW) {}
  while (digitalRead(BUTTON_PIN) == HIGH) {}
}

void loop() {
  if (millis() >= timer_start_time + delay_time && click_start_time < 0) {
    lcd.setCursor(0, 0);
    lcd.print("CLICK!          ");
    click_start_time = millis();
  }

  if (digitalRead(BUTTON_PIN) == HIGH) {
    if (!button_pressed) {
      if (click_start_time > 0) {
        lcd.clear();
        lcd.print("YOUR TIME: ");
        lcd.setCursor(0, 1);

        lcd.print(millis() - click_start_time);
        click_start_time = -1;
      } else {
        lcd.clear();
        lcd.setCursor(0, 1);
        lcd.print("TOO EARLY       ");
        click_start_time = -1;
      }

      waitForButton();
      lcd.clear();
      lcd.print("WAIT FOR LIGHT!");
      timer_start_time = millis();

      delay_time = random(1000, 3000);
      button_pressed = true;
    }
  } else {
    button_pressed = false;
  }
}
