MirrorX m;
PImage one, img;

void setup() {
  m = new MirrorX();
  one = loadImage("Allah.jpg");
  img = m.exe(one);
}

void draw() {
  image(img, 0, 0);
}
