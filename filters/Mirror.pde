class MirrorY {
  PImage imgtwo;
  int i = 0;
  color[][] twodim;
  PImage exe(PImage img) {
    imgtwo = img;
    img.loadPixels();
    twodim = new color[img.width][img.height];
    surface.setSize(img.width, img.height);
    for (int y = 1; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        twodim[x][img.height-y] = img.pixels[i];
        i++;
      }
    }
    i=0;
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        imgtwo.pixels[i]=twodim[x][y];
        i++;
      }
    }
    return(imgtwo);
  }
}

class MirrorX {
  PImage imgtwo;
  int i = 0;
  color[][] twodim;
  PImage exe(PImage img) {
    img = loadImage("Allah.jpg");
    imgtwo = img;
    img.loadPixels();
    twodim = new color[img.width][img.height];
    surface.setSize(img.width, img.height);
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        twodim[img.width-x-1][y] = img.pixels[i];
        i++;
      }
    }
    i=0;
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        imgtwo.pixels[i]=twodim[x][y];
        i++;
      }
    }
    return(imgtwo);
  }
}
