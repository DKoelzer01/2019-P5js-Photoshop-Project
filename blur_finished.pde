class RadialBlur {
  float[] close= new float [27];
  color[] temp;
  color[] temp2;
  color[] temp3;
  color[] img;
  int input;

  RadialBlur(color[] img, int i) {
    this.input = i;
    this.img = img;
    temp = new color[img.length];
    temp2 = new color[img.length];
  }

  color[] exe() {
    temp3 = img;
    temp2 = blur(input, temp3);
    return(temp2);
  }
  color[] blur(int p, color[] temp4) {
    for (int i=width+1; i<(width*height); i++) {
      int n=0;
      if (i > width && (i+width) < temp4.length && i%width != 0 && (i+1) % width != 0) {

        close[n]= red(temp4[i-width-1]);
        n=n+1;
        close[n]= green(temp4[i-width-1]);
        n=n+1;
        close[n]= blue(temp4[i-width-1]);
        n=n+1;
        close[n]= red(temp4[i-width-0]);
        n=n+1;
        close[n]= green(temp4[i-width-0]);
        n=n+1;
        close[n]= blue(temp4[i-width-0]);
        n=n+1;
        close[n]= red(temp4[i-width+1]);
        n=n+1;
        close[n]= green(temp4[i-width+1]);
        n=n+1;
        close[n]= blue(temp4[i-width+1]);
        n=n+1;
        close[n]= red(temp4[i-1]);
        n=n+1;
        close[n]= green(temp4[i-1]);
        n=n+1;
        close[n]= blue(temp4[i-1]);
        n=n+1;
        close[n]= red(temp4[i]);
        n=n+1;
        close[n]= green(temp4[i]);
        n=n+1;
        close[n]= blue(temp4[i]);
        n=n+1;
        close[n]= red(temp4[i+1]);
        n=n+1;
        close[n]= green(temp4[i+1]);
        n=n+1;
        close[n]= blue(temp4[i+1]);
        n=n+1;
        close[n]= red(temp4[i+width-1]);
        n=n+1;
        close[n]= green(temp4[i+width-1]);
        n=n+1;
        close[n]= blue(temp4[i+width-1]);
        n=n+1;
        close[n]= red(temp4[i+width]);
        n=n+1;
        close[n]= green(temp4[i+width]);
        n=n+1;
        close[n]= blue(temp4[i+width]);
        n=n+1;
        close[n]= red(temp4[i+width+1]);
        n=n+1;
        close[n]= green(temp4[i+width+1]);
        n=n+1;
        close[n]= blue(temp4[i+width+1]);

        float ared =(close[0]+close[3]+close[6]+close[9]+close[12]+close[15]+close[18]+close[21]+close[24])/9;
        float agreen =(close[1]+close[4]+close[7]+close[10]+close[13]+close[16]+close[19]+close[22]+close[25])/9;
        float ablue =(close[2]+close[5]+close[8]+close[11]+close[14]+close[17]+close[20]+close[23]+close[26])/9;
        int r=int(ared);
        int g=int(agreen);
        int b=int(ablue);
        temp[i]=color(r, g, b);
      }
    }

    if (p>0) {
      return(blur(p-1, temp));
    } else {
      return(temp);
    }
  }
}
