# COMP0002 C Coursework - Daiqi Wu

![Screenshot](./img/screenshot.png)

## Submit Information

Author : [Daiqi Wu](https://wudaiqi.com)

UCL Email : [daiqi.wu.17@ucl.ac.uk](mailto:daiqi.wu.17@ucl.ac.uk)

Tools Used: Arduino UNO, Processing Java

## Description
This Project is a game that combines the idea of Flappy Bird and the Pong Game. The objective of this game is to control a holder that bounces a ball through obstacles without colliding with the leftmost side of the game canvas. Arduino UNO is used to retrieve light intensity, button press, and temperature information such that the environment in the game will change accordingly. Processing IDE is used in Java mode on PC to run the game itself while communicating with Arduino UNO board.

## How to Use

### Step 1
Download Arduino IDE and Processing IDE, connect Arduino UNO to PC / mac with sensors connected on the breadboard to the Arduino. See below for the circuit diagram:
![Diagram](./img/diagram.png)

### Step 2
Upload the Arduino Code at `directory-to-project/arduino/lightdetection/lightdetection.ino` to the UNO board. Check Serial Port output to `COM4` with `9600 baud`.

### Step 3
Run Processing Java Code at `directory-to-project/processing_code/my_arduino_game/my_arduino_game.pde`. Done!

## Video
[Video Link Here](https://mediacentral.ucl.ac.uk/Play/15452)

## References

Flappy Bird, developed by Dong Nguyen and dotGears, 2013

Pong, developed by Atari, Inc., 1972


