class Launcher {

  String[] resList;
  Integer[] resXList;
  Integer[] resYList;
  int cur;

  void res(float a, float b) {
    String AR = Float.toString(a/b);
    switch(AR) {
      case ("1.7777778"):
      resList = new String[8];
      resXList = new Integer[8];
      resYList = new Integer[8];
      resList[0] = "1024 x 576";
      resXList[0] = 1024;
      resYList[0] = 576;
      resList[1] = "1152 x 648";
      resXList[1] = 1152;
      resYList[1] = 648;
      resList[2] = "1280 x 720";
      resXList[2] = 1280;
      resYList[2] = 720;
      resList[3] = "1366 x 768";
      resXList[3] = 1366;
      resYList[3] = 768;
      resList[4] = "1600 x 900";
      resXList[4] = 1600;
      resYList[4] = 900;
      resList[5] = "1920 x 1080";
      resXList[5] = 1920;
      resYList[5] = 1080;
      resList[6] = "2560 x 1440";
      resXList[6] = 2560;
      resYList[6] = 1440;
      resList[7] = "3840 x 2160";
      resXList[7] = 3840;
      resYList[7] = 2160;
      break;
      case ("1.6"):
      resList = new String[8];
      resXList = new Integer[8];
      resYList = new Integer[8];
      resList[0] = "640 x 480";
      resXList[0] = 640;
      resYList[0] = 480;
      resList[1] = "800 x 600";
      resXList[1] = 800;
      resYList[1] = 600;
      resList[2] = "960 x 720";
      resXList[2] = 960;
      resYList[2] = 720;
      resList[3] = "1024 x 768";
      resXList[3] = 1024;
      resYList[3] = 768;
      resList[4] = "1280 x 960";
      resXList[4] = 1280;
      resYList[4] = 960;
      resList[5] = "1440 x 1080";
      resXList[5] = 1440;
      resYList[5] = 1080;
      resList[6] = "1600 x 1200";
      resXList[6] = 1600;
      resYList[6] = 1200;
      resList[7] = "1920 x 1440";
      resXList[7] = 1920;
      resYList[7] = 1440;
      break;
      case("1.3333334"):
      resList = new String[5];
      resXList = new Integer[5];
      resYList = new Integer[5];
      resList[0] = "1280 x 800";
      resXList[0] = 1280;
      resYList[0] = 800;
      resList[1] = "1440 x 900";
      resXList[1] = 1440;
      resYList[1] = 900;
      resList[2] = "1680 x 1050";
      resXList[2] = 1680;
      resYList[2] = 1050;
      resList[3] = "1920 x 1200";
      resXList[3] = 1920;
      resYList[3] = 1200;
      resList[4] = "2560 x 1600";
      resXList[4] = 2560;
      resYList[4] = 1600;
      break;
    }
  }




  void render() {
    background(200);
    rec(-1, -1, width, 20, color(230));
    rec((width/2)-125, 50, (width/2)+125, height-25, color(230));
    rec(80, 55, 320, 200, 100);
    line(80, 210, 320, 210);
    rec(80, 220, 320, 240, 255);
    rec(80, 250, 210, 365, 255);
    
    Button select = new Button(90, 335, 200, 355, color(100,150,180));
    select.render("startProg");
    select.txt("Start");
    
    Dropdown d = new Dropdown(220,250,320,270,resList,100);
    d.render();
    
    fill(0);
    text("Selected Resolution : ", 90,280);
    text(resList[cur],90,295);
  }
}
