PImage img;
PImage cimg;
void setup() {
  img=loadImage("title.JPG");
  cimg = new PImage(img.height,img.width);
  surface.setSize(img.height, img.width);
}

void draw() {
  for (int i=0; i<img.pixels.length; i++) {
     cimg.pixels[(img.height*(i%img.width)+img.height-1-(i/img.width))]= img.pixels[i];
   
  }
  image(cimg, 0, 0);
}
