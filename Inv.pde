class Invert {
  PImage img;
  PImage exe(PImage img) {
    this.img = img;
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      float r = red(img.pixels[i]);
      float g = green(img.pixels[i]);
      float b = blue(img.pixels[i]);
      r = map(r, 0, 255, 255, 0);
      g = map(g, 0, 255, 255, 0);
      b = map(b, 0, 255, 255, 0);
      img.pixels[i]=color(r, g, b);
    }
    return (img);
  }
}
