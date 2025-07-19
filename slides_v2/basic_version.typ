#set page(width: 1920pt, height: 1080pt, fill: rgb("#fffbfc"))
#set page(footer: context [
  #set text(30pt)
  #h(1fr)
  #counter(page).display("1/1", both: true)
])

/*
#let x = 2.2
#set page(width: 11in * x, height: 8.5in * x, fill: rgb("#fffbfc"))
*/

#set text(40pt, font: "IBM Plex Mono")

#[
  #set align(center + horizon)
  = Introduction to Electronics and Arduino!
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
  - Be creative

  #colbreak()

  #image("arduino.png", width: 100%)
]

#pagebreak()

#[
  #set page(columns: 2)
  = Outline of Workshop
  ---

  + Electricity
  + Circuits
  + Basic Arduino Programming
  + Arduino with Circuits
  + Creating the Project

  #colbreak()

  #align(center + horizon)[#image("project.png", width: 110%)]
]

#[
  #set page(columns: 2)
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
        pinMode(LED_BUILTIN, OUTPUT);
      }

      // the loop() function runs over and over again forever
      void loop() {
        digitalWrite(LED_BUILTIN, HIGH);
        delay(200);
        digitalWrite(LED_BUILTIN, LOW);
        delay(200);
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
    #block(
      stroke: gray,
      fill: rgb("f0f0f0"),
      inset: 20pt,
      radius: 5pt,
      width: 70%,
    )[
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
  = Controlling LEDs
  ---
  - Connect output to LED
  - Connect input to button
  - Use programming to check input
  - Send voltage to LED output

  #colbreak()

  #align(center + horizon)[#image("basic_project.png", width: 100%)]
]

#pagebreak()

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(
      stroke: gray,
      fill: rgb("f0f0f0"),
      inset: 20pt,
      radius: 5pt,
      width: 60%,
    )[
      #set align(left)
      ```c
      const int LED_PIN = 12;
      const int BUTTON_PIN = 4;

      void setup() {
        pinMode(LED_PIN, OUTPUT);
        pinMode(BUTTON_PIN, INPUT);
      }

      void loop() {
        if (digitalRead(BUTTON_PIN) == HIGH) {
          digitalWrite(LED_PIN, HIGH);
          delay(50);
          digitalWrite(LED_PIN, LOW);
          delay(50);
        } else {
          digitalWrite(LED_PIN, HIGH);
          delay(200);
          digitalWrite(LED_PIN, LOW);
          delay(200);
        }
      }
      ```
    ]
  ]
]

#pagebreak()

#[
  #set align(center + horizon)
  #set text(size: 60pt)
  Can you try with 2 LEDs and 2 Buttons?
]

#pagebreak()

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(
      stroke: gray,
      fill: rgb("f0f0f0"),
      inset: 20pt,
      radius: 5pt,
      width: 68%,
    )[
      #set align(left)
      ```c
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
  #align(
    center + horizon,
  )[*consider* \ _learning more_ about programming \ _learning more_ about electronic circuits \ _learning more_ about your interests \ *learning more*]
]
