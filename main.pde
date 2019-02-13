import java.io.*;
import java.lang.Math.*;

MainScreen m = new MainScreen();
Launcher l = new Launcher();

int wtemp;
int htemp;
int w = 400;
int h = 400;
String Stage;

void setup() {
  Stage = "Launcher";
  float w1 = displayWidth;
  float h1 = displayHeight;
  surface.setResizable(true);
  size(400, 400);
  l.res(w1, h1);
}

void draw() {
  surface.setSize(w, h);
  if (Stage == "Launcher")
    l.render();
  if (Stage == "Main")
    m.render();
}

void rec(int x1, int y1, int x2, int y2, color c) {
  rectMode(CORNERS);
  fill(c);
  rect(x1, y1, x2, y2);
  fill(255);
}

void startProg() {
  w = wtemp;
  h = htemp;
  clear();
  Stage = "Main";
}
