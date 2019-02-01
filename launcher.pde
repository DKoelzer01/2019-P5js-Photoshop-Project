import controlP5.*;
import java.io.*;
import java.lang.Math.*;
ControlP5 cp5;

String[] resList;


void lsetup() {
  cp5 = new ControlP5(this);
  DropdownList droplist = cp5.addDropdownList("Resolution");
  float w = displayWidth;
  float h = displayHeight;
  String AR = Float.toString(w/h);
  print(AR, w, h);
  size(400, 400);
  switch(AR) {
    case ("1.7777778"):
    resList = new String[8];
    resList[0] = "1024 x 576";
    resList[1] = "1152 x 648";
    resList[2] = "1280 x 720 (HD)";
    resList[3] = "1366 x 768";
    resList[4] = "1600 x 900";
    resList[5] = "1920 x 1080 (FHD)";
    resList[6] = "2560 x 1440";
    resList[7] = "3840 x 2160 (4K)";
    break;
    case ("1.6"):
    resList = new String[8];
    resList[0] = "640 x 480";
    resList[1] = "800 x 600";
    resList[2] = "960 x 720";
    resList[3] = "1024 x 768";
    resList[4] = "1280 x 960";
    resList[5] = "1440 x 1080";
    resList[6] = "1600 x 1200";
    resList[7] = "1920 x 1440";
    break;
    case("1.3333334"):
    resList = new String[5];
    resList[0] = "1280 x 800";
    resList[1] = "1440 x 900";
    resList[2] = "1680 x 1050";
    resList[3] = "1920 x 1200";
    resList[4] = "2560 x 1600";
    break;
  }
  droplist.setPosition(220, 250);
  droplist.setSize(100, 200);
  droplist.addItems(resList);
}




void ldraw() {
  background(200);
  rec(-1, -1, width, 20, color(230));
  rec((width/2)-125, 50, (width/2)+125, height-25, color(230));
  rec(80, 55, 320, 200, 100);
  line(80, 210, 320, 210);
  rec(80, 220, 320, 240, 100);
  rec(80, 250, 210, 365, 100);
  rec(90,335,200,355,80);
}

void rec(int x1, int y1, int x2, int y2, color c) {
  rectMode(CORNERS);
  fill(c);
  rect(x1, y1, x2, y2);
  fill(255);
}
 
//void controlEvent(droplist.ACTION_CLICK) {
  
//}
