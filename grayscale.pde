class GrayScale {
  int input,x1,x2,y1,y2;
  PImage img;
  GrayScale(PImage img, int i,int x1,int x2,int y1,int y2){
    this.input=i;
    this.img=img;
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }
  
  PImage run() {
    loadPixels();
  img.loadPixels();
  for (int i=0; i<(img.pixels.length); i++) {
    float r =red(img.pixels[i]);
    float g =green(img.pixels[i]);
    float b =blue(img.pixels[i]);
    float a=(r+g+b)/3;
    img.pixels[i]=color(a);
  }
  return(img);
  }  
}
