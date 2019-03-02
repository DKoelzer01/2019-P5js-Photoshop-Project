Frame main = new Frame(this);

import java.util.concurrent.*;
import java.io.*;
import java.lang.Math.*;
import java.lang.reflect.*;

MainScreen m = new MainScreen();
Launcher l = new Launcher();

IO i = new IO();
String file;
int k = 0;
ArrayList<Button> buttons = new ArrayList();
ArrayList<Integer> buttonHov = new ArrayList();
String sel;
PImage canvasImg;
boolean layerx;
int wtemp;
int htemp;
int w = 400;
int h = 400;
String Stage;
float ix, iy, iw, ih, d1, d2;
int s = 0;

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

  if (Stage == "Launcher") {
    surface.setSize(w, h);
    l.render();
  }
  if (Stage == "Main") {
    surface.setSize(w, h);
    m.render();
    if (k == 0) {
      k++;
      m.lay.yee = true;
    }
    if (s == 1) {
      s = 0;
      canvasImg = get(m.c.dx, m.c.dy, m.c.w, m.c.h);
      canvasImg.save(file);
    }
  }
}

void rec(int x1, int y1, int x2, int y2, color c) {
  rectMode(CORNERS);
  fill(c);
  rect(x1, y1, x2, y2);
  fill(255);
}
void rec(int x1, int y1, int x2, int y2, PImage img, color c) {
  rectMode(CORNERS);
  fill(c);
  rect(x1, y1, x2, y2);
  image(img, x1+1, y1+1, (x2-x1)-1, (y2-y1)-1);
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
  try {
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
    if (m.t.col && !m.t.ctrl) {
      loadPixels();
      m.layer.colp = m.layer.col;
      m.layer.col = pixels[(mouseY*width)+mouseX];
    }
    if (m.t.rectThread.x1 == 0 || m.t.rectThread.x2 == 0) {
      m.t.rectThread.push(mouseX, mouseY);
      if (m.t.rectThread.x1 != 0 && m.t.rectThread.x2 != 0) {
        m.t.rectThread.run();
      }
    }
  }
  catch(Exception e) {
  }
}

void fileLoaded(File selection) {
  if (selection == null) {
    println("No file selected");
  } else {
    PImage img = loadImage(selection.getAbsolutePath());
    d1 = float((img.width-m.c.w)/16);
    d2 = float((img.height-m.c.h)/9);
    if (d1 > d2) {
      iw = m.c.w;
      ih = (iw/img.width)*img.height;
      ix = 0;
      iy = (m.c.h/2)-(ih/2);
    } else {
      ih = m.c.h;
      iw = (ih/img.height)*img.width;
      ix = (m.c.w/2)-(iw/2);
      iy = 0;
    }
    m.c.objs.add(new Thing(int(ix), int(iw), int(iy), int(ih), img));
  }
}

void fileSaved(File selection) {
  if (selection == null) {
    println("No file selected");
  } else {
    file = selection.getAbsolutePath() + ".jpg";
    s = 1;
  }
}
