#set page(width: 1920pt, height: 1080pt, fill: rgb("#fffbfc"))
#set page(footer: context [
  #set text(30pt)
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
])

/*
#let x = 2.2
#set page(width: 11in * x, height: 8.5in * x, fill: rgb("#fffbfc"))
*/

#set text(40pt, font: "IBM Plex Mono")

#[
  #set align(center + horizon)
  = Creating a fun game with Arduino! 
  #text(rgb("#888"))[Basics of Arduino Circuits _Eric, Andy, Allen_ ]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Introduction
  ---

  - We are going over everything from the basics
  - Learning _why_ is just as important as _what_

  /*
  - What is everyone's experience with Arduino or Programming or Electronics?
  - Do you want to play a game?
  - What are we doing this workshop?
  */

  *For Students* \
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

  - Electricity
  - Circuits
  - Integration of Arduino
  - Arduino Programming
  - LCD I2C Protocol
  - Programming the Project

  #colbreak()

  #align(center + horizon)[#image("project.png", width: 110%)]
]

#[
  #set page(columns:2)
  = Electricity
  ---

  - Electrons flowing from negative to positive
  - Powers components in its path (LEDs, Arduino, Light Bulb)
  - Electricity can only flow if there is a path

  #colbreak()

  #align(center + horizon)[
    #image("circuit_closed.png")
  ]
]

#pagebreak()

#align(center)[
  #image("circuit_closed.png")
]

#pagebreak()

#align(center)[
  #image("circuit_open.png")
]

#pagebreak()

#align(center)[
  #image("river.png")
]

#[
  #set page(columns: 2)
  = Electricity Terms
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

#align(center)[
  #image("water_mill.png", width: 80%)
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
  - Connects to power source (could be computer)
  - Computer connects to upload code
  - Arduino runs code that is uploaded, with any power source

  #colbreak()

  #align(center + horizon)[#image("arduino.png", width: 90%)]
]

#pagebreak()

#align(center + horizon)[
  #image("arduino_pins.png")
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
      // The setup() function runs once arduino gets power
      void setup() {
        // initialize digital pin 13 for output
        pinMode(13, OUTPUT);
      }
      
      // the loop() function runs over and over again forever
      void loop() {
        // turn the LED on (HIGH is the voltage level)
        digitalWrite(13, HIGH);
      
        // wait for a second (1000 milliseconds)
        delay(1000);
      
        // turn the LED off by making the voltage LOW
        digitalWrite(13, LOW);
      
        // wait for a second (1000 milliseconds)
        delay(1000);
      }
      ```
      /*```c
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
    ```*/
    ]
  ]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Buttons
  ---

  - Buttons control when circuit is open or closed
  - Pushing button connects circuit
  - _"Pull-Down Resistors"_ are necessary when using buttons for input
    - Get rid of excess charge (sends it to *ground*)

  #colbreak()

  #align(center + horizon)[#image("button.png", width: 116%)]

]

#pagebreak()

#align(horizon + center)[
  #image("circuit_open.png")
]

#pagebreak()

#align(horizon)[
  #columns(2)[
    #image("pulldown.png", width: 100%)
    (with pulldown)
    #colbreak()
    #image("nopulldown.png", width: 100%)
    (without pulldown)

    (the slideshow budget ran out)
  ]
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
         // runs if there is high input to the pin
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
    - SCL used for data timing
  - Two other pins are...
    - VCC, for positive voltage
    - GND, for zero voltage
  - With LCD, the data transmitted is the text to display

  #colbreak()

  #align(center + horizon)[#image("i2c.png", width: 100%)]
]

#pagebreak()

#align(center)[
  #image("i2c_sda_scl.png")
  (slideshow budget ran out again)
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
        lcd.init(); // initializes the lcd
        lcd.backlight(); // turns the backlight on
        lcd.print("Starting the LCD"); // prints to the lcd
      }

      void loop() {
        lcd.setCursor(0, 1); // set the cursor to the second row
        lcd.print("                "); // clear line
        lcd.setCursor(0, 1); // set the cursor to the second row again
        lcd.print(millis()); // print time in milliseconds
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
        // set up pins to proper input/output
        pinMode(BUTTON_PIN, INPUT);
        pinMode(LED_PIN, OUTPUT);
      
        // set up lcd, and print welcome message
        lcd.init();
        lcd.backlight();
        lcd.print("CLICK TO START!");
      
        // initialize / reset is the same
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
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 68%)[
      #set align(left)
      ```c
      void loop() {
        if (digitalRead(BUTTON_PIN) == HIGH) { // check if clicked early
          lcd.clear();
          lcd.print("TOO EARLY");
          reset();
        }
        if (millis() >= ledStartTime) { // check if time to turn on led
          // turn on led and display message
          digitalWrite(LED_PIN, HIGH);
          lcd.clear();
          lcd.print("CLICK!");

          // wait until user clicks and calculate time it took
          waitForClick();
          int resultTime = millis() - ledStartTime;

          // clear lcd and print resulting time
          lcd.clear();
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
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 60%)[
      #set align(left)
      ```c
      void reset() {
        waitForClick(); // click to reset

        // turn off led
        digitalWrite(LED_PIN, LOW);

        // clear lcd and print wait message
        lcd.clear();
        lcd.print("WAIT FOR LIGHT!");

        // set led to turn on in 1-3 seconds
        ledStartTime = millis() + random(1000, 3000);
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
  #set page(columns: 2)
  = Reaction Time Game 1v1
  ---
  - Wait for an LED to turn on
  - Two players press button as fast as possible
  - Displays their reaction time, and who won
  - A bit more complicated...?

  #colbreak()

  #align(horizon)[#image("project1v1.png", width: 100%)]
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
      const int LED_PIN = 2;
      
      long ledStartTime; // stores start time of LED turning on
      
      void setup() {
        // set up pins to proper input/output
        pinMode(BUTTON_PIN_1, INPUT);
        pinMode(BUTTON_PIN_2, INPUT);
        pinMode(LED_PIN, OUTPUT);
      
        // set up lcd, and print welcome message
        lcd.init();
        lcd.backlight();
        lcd.print("CLICK TO START!");
      
        // initialize / reset is the same
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
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 52%)[
      #set align(left)
        ```c
        void loop() {
          checkEarlyClick();
          if (millis() >= ledStartTime) { // check if time to start
            lcd.clear();
            lcd.print("CLICK!");
            digitalWrite(LED_PIN, HIGH);
        
            int winningPlayer = waitForClick();
            int resultTime = millis() - ledStartTime;
        
            lcd.clear();
            lcd.print(resultTime);
            lcd.print("ms");
            lcd.setCursor(0, 1);
            lcd.print("Player ");
            lcd.print(winningPlayer);
            lcd.print(" wins");
        
            reset();
          }
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
      void reset() {
        waitForClick(); // click to reset
      
        digitalWrite(LED_PIN, LOW);
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
  #set text(size: 30pt)
  #set page(margin: 0pt)
  #align(center + horizon)[
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 52%)[
      #set align(left)
      ```c
      void checkEarlyClick() {
        if (digitalRead(BUTTON_PIN_1) == HIGH) { // check if clicked early
          lcd.clear();
          lcd.print("TOO EARLY");
          lcd.setCursor(0, 1);
          lcd.print("Player 2 wins");
          reset();
        }
        if (digitalRead(BUTTON_PIN_2) == HIGH) { // check if clicked early
          lcd.clear();
          lcd.print("TOO EARLY");
          lcd.setCursor(0, 1);
          lcd.print("Player 1 wins");
          reset();
        }
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
      int waitForClick() {
        int p1 = 0;
        int p2 = 0;
        while (true) {
          if (p1 == 0 && digitalRead(BUTTON_PIN_1) == LOW) {
            p1++;
          }
          if (p1 == 1 && digitalRead(BUTTON_PIN_1) == HIGH) {
            p1++;
          }
          if (p1 == 2 && digitalRead(BUTTON_PIN_1) == LOW) {
            return 1;
          }
      
          if (p2 == 0 && digitalRead(BUTTON_PIN_2) == LOW) {
            p2++;
          }
          if (p2 == 1 && digitalRead(BUTTON_PIN_2) == HIGH) {
            p2++;
          }
          if (p2 == 2 && digitalRead(BUTTON_PIN_2) == LOW) {
            return 2;
          }
        }
        // shouldn't be possible
        return -1;
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
