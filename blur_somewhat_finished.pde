PImage title;
float[] close= new float [27];
int instance;

void setup() {
  size(1024, 736);

  title=loadImage("pondertitle.JPG");
}

void draw() {
  blur();
}
  void blur(){
  if (instance<=0) {
    title.loadPixels();
    loadPixels();
    for (int i=width+1; i<(width*height); i++) {
      int n=0;
      if (i>width && (i+width)<pixels.length && i%width != 0 && (i+1) % width != 0) {

        close[n]= red(title.pixels[i-width-1]);
        n=n+1;
        close[n]= green(title.pixels[i-width-1]);
        n=n+1;
        close[n]= blue(title.pixels[i-width-1]);
        n=n+1;
        close[n]= red(title.pixels[i-width-0]);
        n=n+1;
        close[n]= green(title.pixels[i-width-0]);
        n=n+1;
        close[n]= blue(title.pixels[i-width-0]);
        n=n+1;
        close[n]= red(title.pixels[i-width+1]);
        n=n+1;
        close[n]= green(title.pixels[i-width+1]);
        n=n+1;
        close[n]= blue(title.pixels[i-width+1]);
        n=n+1;
        close[n]= red(title.pixels[i-1]);
        n=n+1;
        close[n]= green(title.pixels[i-1]);
        n=n+1;
        close[n]= blue(title.pixels[i-1]);
        n=n+1;
        close[n]= red(title.pixels[i]);
        n=n+1;
        close[n]= green(title.pixels[i]);
        n=n+1;
        close[n]= blue(title.pixels[i]);
        n=n+1;
        close[n]= red(title.pixels[i+1]);
        n=n+1;
        close[n]= green(title.pixels[i+1]);
        n=n+1;
        close[n]= blue(title.pixels[i+1]);
        n=n+1;
        close[n]= red(title.pixels[i+width-1]);
        n=n+1;
        close[n]= green(title.pixels[i+width-1]);
        n=n+1;
        close[n]= blue(title.pixels[i+width-1]);
        n=n+1;
        close[n]= red(title.pixels[i+width]);
        n=n+1;
        close[n]= green(title.pixels[i+width]);
        n=n+1;
        close[n]= blue(title.pixels[i+width]);
        n=n+1;
        close[n]= red(title.pixels[i+width+1]);
        n=n+1;
        close[n]= green(title.pixels[i+width+1]);
        n=n+1;
        close[n]= blue(title.pixels[i+width+1]);

        float ared =(close[0]+close[3]+close[6]+close[9]+close[12]+close[15]+close[18]+close[21]+close[24])/9;
        float agreen =(close[1]+close[4]+close[7]+close[10]+close[13]+close[16]+close[19]+close[22]+close[25])/9;
        float ablue =(close[2]+close[5]+close[8]+close[11]+close[14]+close[17]+close[20]+close[23]+close[26])/9;
        int r=int(ared);
        int g=int(agreen);
        int b=int(ablue);
        pixels[i]=color(r, g, b);
        println(r, g, b);
      }
    }
  }
  println("done");
  updatePixels();

  instance++;
}
