//Written by Daiqi Wu
//Idea from Flappy Bird and Ping Pong game
//Used arduino to set the color tone

import processing.serial.*;

Serial port = new Serial(this, "COM4", 9600);
int control_count = 0;

int dark_mode = 0;
int color_mode = 0;
int light;

int width = 1280;
int height  = 720;
int score = 0;

public class ball {
  public float x = width / 2;
  public float y = height / 2;
  public float v_speed = 0;
  public float h_speed = 3;
  public int s = 25;
  public int c_b = color(66, 161, 244, 255);
  public int c_d = color(244, 66, 104, 255);
  public float speed_limit = 20;
}

public class nature {
  public float gravity = 0.7;
  public float air_resistance = 0.0001;
  public float friction = 0.0001;
}

public class holder {
  public float x = width / 2;
  public float y = height / 3 * 2;
  public float y_prev = width / 3 * 2;
  public float w = 150;
  public float h = 5;
  public float speed = 10;
  public int c_b = color(0);
  public int c_d = color(240);
}

public class wall_constant {
  public float s = 3;
  public float w = 20;
  public float t = 0;
  public float t_gap = 2000;
  public float min_h = 200;
  public float max_h = 400;
  public int c_b = color(0);
  public int c_d = color(240);
}

public class wall {
  public float x = width;
  public float y = 0;
  public float h = 0;
}

ball b = new ball();
nature n = new nature();
holder h = new holder();
wall_constant w_c = new wall_constant();
ArrayList<wall> w = new ArrayList<wall>();

int screen;

void setup() {
  size(1280, 720);
  screen = 0;
  frameRate(60);
  noStroke();
  //port.bufferUntil('\n');
}

void draw() {
  set_color_mode();
  set_ball_size(); //this is not in draw_ball section because reading input from Arduino cause glitches
  if (screen == 0) start_screen();
  if (screen == 1) game_screen();
  if (screen == 2) game_over_screen();
}

void set_color_mode() {
  String lls = trim(port.readStringUntil(' '));
  if ((lls != null) && (int(lls) != 0) && (int(lls) < 260)) light = int(lls);
  print(light); print(' ');
  if (light >= 128) dark_mode = 0; else dark_mode = 1;
  String bbs = trim(port.readStringUntil(' '));
  if (bbs != null) {
    if ((int(bbs) == 1023) || (int(bbs) == 0)) color_mode = int(bbs);
  }
  print(color_mode); print(' ');
  //if (bbs == "1023") color_mode = color_mode ^ color_mode;
}

void set_ball_size() {
  String ball_size_string = trim(port.readStringUntil('\n'));
  if (ball_size_string != null) {
    if ((int(ball_size_string) >= 270) || (int(ball_size_string) <= 300))  b.s = int(ball_size_string) - 260;
  }
  println(b.s);
}

void start_screen() {
  if (dark_mode == 0) {
    background(light);
    fill(0, 0, 0, 255);
  } else {
    background(light);
    fill(240, 240, 240, 255);
  }
  textAlign(CENTER);
  textSize(32);
  text("Click / Type anywhere to start", width / 2, height / 2); 
  start_game();
}

void start_game() {
  if (keyPressed) screen = 1;
}

void game_screen() {
  if (dark_mode == 0) {
    background(light);
    fill(0, 0, 0, 255);
  } else {
    background(light);
    fill(240, 240, 240, 255);
  }
  draw_ball();
  draw_holder();
  move_holder();
  calc_ball_pos();
  wall_controller();
  draw_score();
}

void draw_ball() {
  if (color_mode == 0) fill(b.c_b); else fill(b.c_d);
  ellipse(b.x, b.y, b.s, b.s);
}



void calc_ball_pos() {
  in_the_air();
  border_patrol();
  holder_interaction();
}

void in_the_air() {
  b.v_speed += n.gravity - (n.air_resistance * b.v_speed);
  b.h_speed -= n.air_resistance * b.h_speed;
  if (b.v_speed > b.speed_limit) b.v_speed = b.speed_limit;
  if (b.h_speed > b.speed_limit) b.h_speed = b.speed_limit;
  b.y += b.v_speed;
  b.x += b.h_speed;
  return;
}

void bounce_surface(float surface, int sign) {
  if (sign == 0) b.y = surface + (b.s / 2);
  else if (sign == 1) b.y = surface - (b.s / 2);
  else if (sign == 2) b.x = surface + (b.s / 2);
  else if (sign == 3) b.x = surface - (b.s / 2);
  if ((sign == 2) || (sign == 3)) b.h_speed = - b.h_speed + b.h_speed * n.friction;
  if ((sign == 0) || (sign == 1)) b.v_speed = - b.v_speed + b.v_speed * n.friction;
  return;
}

void border_patrol() {
  if (b.y + (b.s / 2) > height) bounce_surface(height, 1);
  if (b.y - (b.s / 2) < 0) bounce_surface(0, 0);
  //if (b.x - (b.s / 2) < 0) bounce_surface(0, 2);
  if (b.x - (b.s / 2) < 0) screen = 2;
  if (b.x + (b.s / 2) > width) bounce_surface(width, 3);
}

void draw_holder() {
  if (dark_mode == 0) fill(h.c_b); else fill(h.c_d);
  rectMode(CENTER);
  rect(h.x, h.y, h.w, h.h);
}

void move_holder() {
  //if (port.available() > 0) {
  //  int c_out = 0;
  //  String control = trim(port.readStringUntil(' '));
  //  if (control != null) c_out = int(control);
  //  if ((c_out >= 1022) && (c_out <= 1023) && (h.x > 0))  h.x -= h.speed;
  //  control = trim(port.readStringUntil(' '));
  //  if (control != null) c_out = int(control);
  //  if ((c_out >= 1013) && (c_out <= 1014) && (h.x < width))  h.x += h.speed;
  //  control = trim(port.readStringUntil(' '));
  //  if (control != null) c_out = int(control);
  //  if ((c_out >= 997) && (c_out <= 998) && (h.y > 0))  h.y -= h.speed;
  //  control = trim(port.readStringUntil(' '));
  //  if (control != null) c_out = int(control);
  //  if ((c_out >= 996) && (c_out <= 1000) && (h.y < height))  h.y += h.speed;
  //  control = port.readStringUntil('\n');
  //} else {    
      h.x = mouseX;
      h.y_prev = h.y;
      h.y = mouseY;
  //}
  //if (keyPressed) {
  //  h.y_prev = h.y;
  //  if (key == 'w') h.y -= h.speed;
  //  else if (key == 's') h.y += h.speed;
  //  else if (key == 'a') h.x -= h.speed;
  //  else if (key == 'd') h.x += h.speed;
  //}
}

void holder_interaction() {
  float accl = h.y - h.y_prev;
  bounce_vertical(accl);
  bounce_horizontal(accl);
}

void bounce_vertical(float accl) {
  if ((b.x + (b.s / 2) > h.x - (h.w / 2)) && (b.x - (b.s / 2) < h.x + (h.w / 2)) && (dist(b.x, b.y, b.x, h.y) <= (b.s / 2) + abs(accl)) &&
   (b.y + (b.s / 2) > h.y) && (b.y - (b.s / 2) < h.y + h.w / 2)) {
    bounce_surface(h.y, 1);
    if (accl < 0) {
      b.y += accl;
      b.v_speed += accl;
    }
  }
  if ((b.x + (b.s / 2) > h.x - (h.w / 2)) && (b.x - (b.s / 2) < h.x + (h.w / 2)) && (dist(b.x, b.y, b.x, h.y) <= (b.s / 2) + abs(accl)) &&
  (b.y + (b.s / 2) > h.y + h.w / 2) && (b.y - (b.s / 2) < h.y + h.w)) {
    bounce_surface(h.y + h.w, 0);
    if (accl > 0) {
      b.y += accl; 
      b.v_speed += accl;
    }
  }
}

void bounce_horizontal(float accl) {
  if ((b.x + (b.s / 2) > h.x - (h.w / 2)) && (b.x - (b.s / 2) < h.x + (h.w / 2)) && (dist(b.x, b.y, b.x, h.y) <= (b.s / 2) + abs(accl))) b.h_speed += (b.x - h.x) / 20;
}

void wall_controller(){
  add_wall();
  refresh_wall();
}

void add_wall() {
  if (millis() - w_c.t > w_c.t_gap) {
    float h = random(w_c.min_h, w_c.max_h);
    float y = random(0, height - h);
    wall new_wall = new wall();
    new_wall.x = width;
    new_wall.y = y;
    new_wall.h = h; 
    w.add(new_wall);
    w_c.t = millis();
   }
}

void refresh_wall() {
  for (int i = 0; i < w.size(); i++ ) {
    remove_wall(i);
    shift_wall(i);
    draw_new_wall(i);
    bounce_wall(i);
  }
}

void remove_wall(int i) {
  wall old_wall = w.get(i);
  if (old_wall.x + w_c.w < 0) {
    w.remove(i);
    score += 1;
  }
}

void shift_wall(int i) {
  wall old_wall = w.get(i);
  old_wall.x -= w_c.s;
}

void draw_new_wall(int i) {
  wall draw_wall = w.get(i);
  float x = draw_wall.x;
  float y = draw_wall.y;
  float wid = w_c.w;
  float h = draw_wall.h;
  rectMode(CORNER);
  if (dark_mode == 0) fill(w_c.c_b); else fill(w_c.c_d);
  rect(x, 0, wid, y);
  rect(x, y+h, wid, height - (y + h));
}

void bounce_wall(int i) {
  wall to_calc = w.get(i);
  float x = to_calc.x;
  float y = to_calc.y;
  float wid = w_c.w;
  float h = to_calc.h;
  if ((b.x + (b.s / 2) > x) && (b.x - (b.s / 2) < x + wid / 2) && (b.y - (b.s / 2) < y)) bounce_surface(x, 3);
  else if ((b.x + (b.s / 2) > x) && (b.x - (b.s / 2) < x + wid / 2) && (b.y + (b.s / 2) > y + h)) bounce_surface(x, 3);
   
  else if ((b.x + (b.s / 2) > x + wid / 2) && (b.x - (b.s / 2) < x + wid) && (b.y - (b.s / 2) < y)) bounce_surface(x + wid, 2);
  else if ((b.x + (b.s / 2) > x + wid / 2) && (b.x - (b.s / 2) < x + wid) && (b.y + (b.s / 2) > y + h)) bounce_surface(x + wid, 2);
  
  else if ((b.x + (b.s / 2) > x) && (b.x - (b.s / 2) < x + wid) && (b.y - (b.s / 2) < y)) bounce_surface(y, 0);
  else if ((b.x + (b.s / 2) > x) && (b.x - (b.s / 2) < x + wid) && (b.y + (b.s / 2) > y + h)) bounce_surface(y, 1);
}

void draw_score() {
  if (dark_mode == 0) fill(66, 161, 244, 255); else fill(244, 66, 104, 255);
  textAlign(CORNER);
  textSize(50);
  text(score, width / 2, 50);
}

void game_over_screen() {
  if (dark_mode == 0) {
    background(light); 
    fill(0, 0, 0, 255);
  } else {
    background(light);
    fill(240, 240, 240, 255);
  }
  textAlign(CENTER);
  textSize(32);
  text("Press any button to restart", width / 2, height / 2); 
  text("Your Scores is ", width / 2, height / 3 * 2);
  text(score, width / 2 + 150, height / 3 * 2);
  if (keyPressed) restart_game();
}

void restart_game() {
  b = new ball();
  n = new nature();
  h = new holder();
  w_c = new wall_constant();
  w = new ArrayList<wall>();
  score = 0;
  screen = 1;
}
