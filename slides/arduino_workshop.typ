#set page(width: 1920pt, height: 1080pt, fill: rgb("#fffbfc"))

/*
#let x = 2.2
#set page(width: 11in * x, height: 8.5in * x, fill: rgb("#fffbfc"))
*/

#set text(40pt, font: "IBM Plex Mono")

#[
  #set align(center + horizon)
  = Creating a fun game with Arduino! 
  #text(rgb("#888"))[Basics of Arduino Circuits with _Eric Xiao_]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Introduction
  ---

  - What is everyone's experience with Arduino or Programming or Electronics?
  - Do you want to play a game?
  - What are we doing this workshop?

  *RULES* \
  ---
  - Follow along with the workshop
  - Ask questions whenever you want
  - Try to be creative \ (ignore rule one sometimes)

  #colbreak()

  #align(center + horizon)[
    #set text(36pt)
    $ upright("The area of a circle with radius r is:") $
    #v(-7pt)
    #set text(14.5pt)
    $ A = 2 integral_(- r)^r sqrt(r^2 - x^2) d x $ $ upright("let ") x = r sin theta arrow.r.double.long d x = r cos theta d theta $ $ = 2 integral_(x = - r)^(x = r) sqrt(r^2 - lr((r sin theta))^2) dot.op r cos theta d theta $ $ = 2 r^2 integral_(- r)^r sqrt(1 - sin theta^2) dot.op cos theta d theta $ $ = 2 r^2 integral_(- r)^r cos^2 theta d theta $ $ = 2 r^2 integral_(- r)^r frac(cos 2 theta + 1, 2) d theta $ $ = r^2 integral_(- r)^r lr((cos 2 theta + 1)) d theta $ $ = r^2 lr([1 / 2 sin 2 theta + theta])_(- r)^r $ $ = r^2 lr([sin theta cos theta + theta])_(- r)^r $ $ = r^2 lr([x / r dot.op sqrt(r^2 - x^2) / r + arcsin lr((x / r))])_(- r)^r $ $ = r^2 lr((r / r dot.op sqrt(r^2 - r^2) / r + arcsin lr((r / r)))) - lr(
      (frac(- r, r) dot.op sqrt(r^2 - lr((- r))^2) / r + arcsin lr((frac(- r, r))))
    ) $ $ = r^2 lr((lr((pi / 2)) - lr((- pi / 2)))) $ $ = r^2 pi $ 
    #v(-30pt)
    #set text(60pt)
    $ #box(stroke: black, inset: 10pt, [$ A = pi r^2 $]) $
  ]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Outline of Workshop
  ---

  - Basic Circuits and Electrical Wiring
  - Integration of Arduino
  - Arduino Programming
  - LCD I2C Protocol
  - Wiring the Circuit
  - Programming the Project

  #colbreak()

  #align(center + horizon)[#image("project.png", width: 110%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Electricity
  ---

  - *Current* = How much electricity flows per second
  - *Voltage* = Potential electricity
  - *Resistance* = How much electricity a material stops
  #v(48pt)
  - Ohm's Law: $V = I R ==> I = V/R$
  - Too much current = some components overheat and break
    - LEDs, Arduino, etc.

  #colbreak()

  // #align(center + horizon)[#image("circuit.png", width: 100%)]
  #align(right + horizon)[#image("resistorcircuit.png", width: 95%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  = LEDs
  ---

  - *Light-emitting diode*
  - Diode lets current go through _one direction_
  - LED = _"thing that lights up when current goes through in a certain direction"_
  - Longer end to high voltage (*5V*), shorter end to low voltage (*Ground*)

  #colbreak()

  #align(center + horizon)[#image("leds.png")]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Circuits and Wiring
  ---

  - Circuit on *breadboard*, with wires and other components
    - LEDs, Buttons, LCDs, Arduino, resistor, etc.
  - Breadboards make wiring _easy to change_
    - Connects wires just by plugging in
    - Blue is connected, red is connected, black is connected
    - Great for learning & projects

  #colbreak()

  #align(center + horizon)[#image("breadboard.png", width: 85%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Arduino
  ---

  - Has pins for _output_ and _input_
  - Has pins for *ground* and *V5* / *V3.3* (constant)
  - Computer connects to upload code
  - Arduino runs code that is uploaded, with any power source

  #colbreak()

  #align(center + horizon)[#image("arduino.png", width: 90%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Arduino Code
  ---

  - Uses Arduino language (C++ with special built-in functions)
    - _digitalWrite_(...), _delay_(...), _analogRead_(...), etc.
  - Runs *setup*, then runs *loop* function until it is off
  
  #colbreak()

  #set text(30pt)

  #align(horizon)[
    #text(25pt, rgb("#888"))[Code that turns LED on and off]
    #v(-20pt)
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt)[
      ```c
      const int LED_PIN = 6; // digital 6 pin
      
      void setup() {
        pinMode(LED_PIN, OUTPUT); // set pin to output
      }
      
      void loop() {
        digitalWrite(LED_PIN, HIGH); // turn on
        delay(1000); // in milliseconds
        
        digitalWrite(LED_PIN, LOW); // turn off
        delay(1000); // in milliseconds
      }
    ```
    ]
  ]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Buttons
  ---

  - Controls when wires are connected
  - _"Pull-Down Resistors"_ are necessary when using buttons for input
    - Get rid of excess charge (sends it to *ground*)

  #colbreak()

  #align(center + horizon)[#image("pulldownresistor.png", width: 116%)]
]

#pagebreak()

#[
  = Code with Button Logic
  ---

  #set text(30pt)
    #align(center + horizon)[
      #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 70%)[
        #set align(left)
      ```c
      const int BUTTON_PIN = 10;
      const int LED_PIN = 6;
      
      void setup() {
        pinMode(LED_PIN, OUTPUT);
        pinMode(BUTTON_PIN, INPUT); // set pin to input
      }
      
      void loop() {
         //checks if there is high or low input to the pin
        if (digitalRead(BUTTON_PIN) == HIGH) {
           // flash light once
          digitalWrite(LED_PIN, HIGH);
          delay(100);
          digitalWrite(LED_PIN, LOW);
          delay(100);
        }
      }
    ```
    ]
  ]  
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = LCD I2C Protocol
  ---

  - Uses two signals
    - SDA used to transmit data
    - SCL used to synchronize data
  - Two other pins are...
    - VCC, just constant voltage
    - GND, just zero voltage
  - With LCD, the data transmitted is the text to display

  #colbreak()

  #align(center + horizon)[#image("i2c.png", width: 100%)]
]

#pagebreak()

#[
  = LCD I2C Code
  ---
  #set text(30pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 60%)[
      #set align(left)
      ```c
      #include <LiquidCrystal_I2C.h>
      
      LiquidCrystal_I2C lcd(0x27, 16, 2); // port, rows, columns

      void setup() {
        lcd.init();
        lcd.backlight();
        lcd.print("Starting the LCD");
      }

      void loop() {
        lcd.setCursor(0, 1);
        lcd.print("                "); // clear line
        lcd.setCursor(0, 1);
        lcd.print(millis()); // the time in milliseconds
        lcd.print("ms");
        delay(200);
      }
      ```
    ]
  ]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Reaction Time Game
  ---
  - Wait for an LED to turn on
  - Player presses button ASAP
  - Displays their reaction time
  - That's it!
  - But will still be challenging..

  #colbreak()

  #align(center + horizon)[#image("project1.png", width: 100%)]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 60%)[
      #set align(left)
      ```c
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
      ```
    ]
  ]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 60%)[
      #set align(left)
      ```c
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
      ```
    ]
  ]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 60%)[
      #set align(left)
      ```c
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
      ```
    ]
  ]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 68%)[
      #set align(left)
      ```c
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
      ```
    ]
  ]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Reaction Time Game 2 Buttons
  ---
  - Wait for an LED to turn on
  - Player presses *correct* button as fast as possible
  - Displays their reaction time, or states they pressed the wrong button
  - A bit more complicated...?

  #colbreak()

  #align(horizon)[#image("project2.png", width: 100%)]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #set page(margin: 0pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 60%)[
      #set align(left)
      ```c
      #include <LiquidCrystal_I2C.h>

      LiquidCrystal_I2C lcd(0x27, 16, 2);
      
      const int BUTTON_PIN_1 = 10;
      const int BUTTON_PIN_2 = 12;
      const int LED_PIN_1 = 2;
      const int LED_PIN_2 = 4;
      
      int targetButton;
      long ledStartTime;
      
      void setup() {
        pinMode(BUTTON_PIN_1, INPUT);
        pinMode(BUTTON_PIN_2, INPUT);
        pinMode(LED_PIN_1, OUTPUT);
        pinMode(LED_PIN_2, OUTPUT);
      
        lcd.init();
        lcd.backlight();
        lcd.print("Press any button");
        lcd.setCursor(0,1);
        lcd.print("to start..");
        reset();
      }
      ```
    ]
  ]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #set page(margin: 0pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 68%)[
      #set align(left)
      ```c
      int waitForClick() {
        int pressedButton;
        while (true) {
          if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
            break;
          }
        }
        while (true) {
          if (digitalRead(BUTTON_PIN_1) == HIGH) {
            pressedButton = 1;
            break;
          }
          if (digitalRead(BUTTON_PIN_2) == HIGH) {
            pressedButton = 2;
            break;
          }
        }
        while (true) {
          if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
            break;
          }
        }
        return pressedButton;
      }
      ```
    ]
  ]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #set page(margin: 0pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 52%)[
      #set align(left)
      ```c
      int getClickTime() {
        int pressedButton = waitForClick();
        if (pressedButton == targetButton) {
          return millis() - ledStartTime;
        } else {
          return -1;
        }
      }
      
      void reset() {
        waitForClick();
      
        digitalWrite(LED_PIN_1, LOW);
        digitalWrite(LED_PIN_2, LOW);
        lcd.clear();
        lcd.print("WAIT FOR LIGHT!");
      
        ledStartTime = millis() + random(1000, 3000);
      }
      ```
    ]
  ]
]

#pagebreak()

#[
  #set text(size: 27pt)
  #set page(margin: 0pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 67%)[
      #set align(left)
      ```c
      void loop() {
        if (digitalRead(BUTTON_PIN_1) == HIGH || digitalRead(BUTTON_PIN_2) == HIGH) {
          lcd.clear();
          lcd.setCursor(0, 1);
          lcd.print("TOO EARLY");
          reset();
        }
        if (millis() >= ledStartTime) {
          lcd.clear();
          lcd.print("CLICK!");
          targetButton = random(2) + 1; // (0 or 1) + 1 = 1 or 2
          if (targetButton == 1) {
            digitalWrite(LED_PIN_1, HIGH);
          } else {
            digitalWrite(LED_PIN_2, HIGH);
          }
      
          int resultTime = getClickTime();
      
          lcd.clear();
          if (result == -1) {
            lcd.print("WRONG BUTTON");
          } else {
            lcd.print("YOUR TIME: ");
            lcd.setCursor(0, 1);
            lcd.print(resultTime);
            lcd.print("ms");
          }
      
          reset();
        }
      }
      ```
    ]
  ]
]

#pagebreak()

#[
  #align(center + horizon)[= THANK YOU FOR COMING TO THE WORKSHOP]
]

#pagebreak()

#[
  #align(center + horizon)[*consider* \ _learning more_ about programming \ _learning more_ about electronic circuits \ _learning more_ about your interests \ *learning more*]
]
