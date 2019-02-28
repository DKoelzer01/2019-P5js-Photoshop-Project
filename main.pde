
Frame main = new Frame(this);

import java.io.*;
import java.lang.Math.*;
import java.lang.reflect.*;

MainScreen m = new MainScreen();
Launcher l = new Launcher();
Filters f = new Filters();
IO i = new IO();

ArrayList<Button> buttons = new ArrayList();
ArrayList<Integer> buttonHov = new ArrayList();

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
  m.MainScreenSetup();
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
void rec(int x1, int y1, int x2, int y2, PImage img,color c) {
  rectMode(CORNERS);
  fill(c);
  rect(x1, y1, x2, y2);
  image(img,x1+1,y1+1,(x2-x1)-1,(y2-y1)-1);
}

void startProg() {
  w = wtemp;
  h = htemp;
  clear();
  Stage = "Main";
}

void mouseClicked() {
  for (int i = 0; i < buttonHov.size(); i++) {
    if (buttonHov.get(i) == 1) {
      buttons.get(i).pressed = true;
    } else {
      buttons.get(i).pressed = false;
    }
  }
  if (l.d.drop.pressed) {
    l.d.toggleT = true;
  }
  if (m.file.drop.pressed) {
    m.file.toggleT = true;
  }
  if (m.edit.drop.pressed) {
    m.edit.toggleT = true;
  }
  if (m.filter.drop.pressed) {
    m.filter.toggleT = true;
  }
}

void fileLoaded(File selection) {
  if (selection == null) {
    println("No file selected");
  } else {
    PImage img = loadImage(selection.getAbsolutePath());
    m.c.objs.add(new Thing(0, width/2, 0, height/2, img));
  }
}

void fileSaved(File selection) {
  if (selection == null) {
    println("No file selected");
  } else {
    PImage canvasImg = get(width/4,height/4,(3*width)/4,(3*height)/4);
    canvasImg.save(selection.getAbsolutePath());
  }
}
