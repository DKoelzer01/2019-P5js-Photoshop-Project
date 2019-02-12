import java.io.*;
import java.lang.Math.*;

Launcher l = new Launcher();

int w = 400;
int h = 400;

void setup() {
  float w1 = displayWidth;
  float h1 = displayHeight;
  surface.setResizable(true);
  size(400, 400);
  l.res(w1, h1);
}

void draw() {
  surface.setSize(w, h);
    l.render();
}

void rec(int x1, int y1, int x2, int y2, color c) {
  rectMode(CORNERS);
  fill(c);
  rect(x1, y1, x2, y2);
  fill(255);
}

void dropbox() {
}

void keyPressed() {
  w = l.endX();
  h = l.endY();
}
