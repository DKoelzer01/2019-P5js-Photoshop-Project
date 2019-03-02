class RadialBlur {
  float[] close= new float [27];
  PImage temp,temp2,img;
  PImage out = new PImage();
  int input;
  
  PImage exe(PImage in, int i) {
    this.input = i;
    in.loadPixels();
    this.img = in;
    temp = new PImage(img.width,img.height);
    temp2 = new PImage(img.width,img.height);
    temp2 = blur(input, img);
    return(out);
  }
  PImage blur(int p, PImage temp3) {
    for (int i=width+1; i<(width*height); i++) {
      int n=0;
      if (i > width && (i+width) < temp3.pixels.length && i%width != 0 && (i+1) % width != 0) {

        close[n]= red(temp3.pixels[i-width-1]);
        n=n+1;
        close[n]= green(temp3.pixels[i-width-1]);
        n=n+1;
        close[n]= blue(temp3.pixels[i-width-1]);
        n=n+1;
        close[n]= red(temp3.pixels[i-width-0]);
        n=n+1;
        close[n]= green(temp3.pixels[i-width-0]);
        n=n+1;
        close[n]= blue(temp3.pixels[i-width-0]);
        n=n+1;
        close[n]= red(temp3.pixels[i-width+1]);
        n=n+1;
        close[n]= green(temp3.pixels[i-width+1]);
        n=n+1;
        close[n]= blue(temp3.pixels[i-width+1]);
        n=n+1;
        close[n]= red(temp3.pixels[i-1]);
        n=n+1;
        close[n]= green(temp3.pixels[i-1]);
        n=n+1;
        close[n]= blue(temp3.pixels[i-1]);
        n=n+1;
        close[n]= red(temp3.pixels[i]);
        n=n+1;
        close[n]= green(temp3.pixels[i]);
        n=n+1;
        close[n]= blue(temp3.pixels[i]);
        n=n+1;
        close[n]= red(temp3.pixels[i+1]);
        n=n+1;
        close[n]= green(temp3.pixels[i+1]);
        n=n+1;
        close[n]= blue(temp3.pixels[i+1]);
        n=n+1;
        close[n]= red(temp3.pixels[i+width-1]);
        n=n+1;
        close[n]= green(temp3.pixels[i+width-1]);
        n=n+1;
        close[n]= blue(temp3.pixels[i+width-1]);
        n=n+1;
        close[n]= red(temp3.pixels[i+width]);
        n=n+1;
        close[n]= green(temp3.pixels[i+width]);
        n=n+1;
        close[n]= blue(temp3.pixels[i+width]);
        n=n+1;
        close[n]= red(temp3.pixels[i+width+1]);
        n=n+1;
        close[n]= green(temp3.pixels[i+width+1]);
        n=n+1;
        close[n]= blue(temp3.pixels[i+width+1]);

        float ared =(close[0]+close[3]+close[6]+close[9]+close[12]+close[15]+close[18]+close[21]+close[24])/9;
        float agreen =(close[1]+close[4]+close[7]+close[10]+close[13]+close[16]+close[19]+close[22]+close[25])/9;
        float ablue =(close[2]+close[5]+close[8]+close[11]+close[14]+close[17]+close[20]+close[23]+close[26])/9;
        int r=int(ared);
        int g=int(agreen);
        int b=int(ablue);
        temp.pixels[i]=color(r, g, b);
      }
    }

    if (p>0) {
      return(blur(p-1, temp));
    } else {
      return(temp);
    }
  }
}
