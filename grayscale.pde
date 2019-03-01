class GrayScale {
  PImage exe(PImage img) {
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
