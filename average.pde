class Average {
  float r,g,b = 0;
  PImage exe(PImage img) {
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

}
