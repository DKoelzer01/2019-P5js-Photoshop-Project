class Average {
  PImage img;
  float r=0;
  float g=0;
  float b=0;
  int input, x1, x2, y1, y2;
  Average(PImage img, int i, int x1, int x2, int y1, int y2) {
    this.input=i;
    this.img=img;
    this.x1=x1
      this.x2=x2;
    this.y1=y1;
    this.y2=y2;
  }

  PImage run() {
    loadPixels();
    img.loadPixels();
    for (int i =0; i<(img.pixels.length); i++) {
      r=r+red(img.pixels[i]);
      g=g+green(img.pixels[i]);
      b=b+blue(img.pixels[i]);
    }
    r=r/img.pixels.length;
    g=g/img.pixels.length;
    b=b/img.pixels.length;
    int red =int(r);
    int green =int(g);
    int blue =int(b);
    for (int i=0; i<img.pixels.length; i++) {
      img.pixels[i]= color(red, green, blue);
    }
    return (img);
  }

  //void setup(){
  //  img=loadImage("pondertitle.JPG");
  // surface.setSize(img.width,img.height); 
  //}
  //void draw(){
  //  loadPixels();
  // for (int i =0; i<(img.pixels.length); i++){
  //  r=r+red(img.pixels[i]);
  //  g=g+green(img.pixels[i]);
  //  b=b+blue(img.pixels[i]);
  // }
  // r=r/img.pixels.length;
  // g=g/img.pixels.length;
  // b=b/img.pixels.length;
  // int red =int(r);
  // int green =int(g);
  // int blue =int(b);
  //for (int i=0; i<img.pixels.length;i++){
  //pixels[i]= color(red,green,blue);
  //}
  ////println(red,green,blue);
  //updatePixels();
  ////println(red(pixels[1]),green(pixels[1]),blue(pixels[1]));

  //}
