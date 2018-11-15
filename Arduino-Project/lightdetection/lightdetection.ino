void setup() {
  Serial.begin(9600);
}

int light = 0;
int button = 0;
int temperature = 0;
void loop() {
  light = map(analogRead(A0), 0, 1023, 0, 255);
  button = analogRead(A4);
  temperature = map(analogRead(A3), 550, 750, 265, 340);  
  Serial.print(light); Serial.print(' '); 
  Serial.print(button); Serial.print(' ');
  Serial.println(temperature);
  delay(20);
}
