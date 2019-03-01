class Rotate {
  PImage exe(PImage img) {
    PImage cimg = img;
    for (int i=0; i<img.pixels.length; i++) {
      cimg.pixels[(img.height*(i%img.width)+img.height-1-(i/img.width))]= img.pixels[i];
    }
    return cimg;
  }
}
