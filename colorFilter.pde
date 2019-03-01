class ColorFilter {
  int c;
  color a;
  PImage img;
  ColorFilter(int c) {
    this.c = c;
  }

  PImage exe(PImage img) {
    loadPixels();
    img.loadPixels();
    for (int i=0; i<(img.pixels.length); i++) {
      if (c == 0) {
        float r =red(img.pixels[i]);
        float g =green(img.pixels[i]);
        float b =blue(img.pixels[i]);
        a = color((r+g+b)/3, 0, 0);
      }
      if (c == 1) {
        float r =red(img.pixels[i]);
        float g =green(img.pixels[i]);
        float b =blue(img.pixels[i]);
        a = color(0, (r+g+b)/3, 0);
      }
      if (c == 2) {
        float r =red(img.pixels[i]);
        float g =green(img.pixels[i]);
        float b =blue(img.pixels[i]);
        a = color(0, 0, (r+g+b)/3);
      }
      img.pixels[i] = a;
    }
    return(img);
  }
}
