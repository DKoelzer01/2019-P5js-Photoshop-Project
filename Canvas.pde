class Canvas {
  ArrayList<Thing> objs = new ArrayList();
  int dx, dy, dx2, dy2,w,h;
  void render() {
    rec(dx, dy, dx2, dy2, 0);
    pushMatrix();
    translate(width/4, height/4);
    for (Thing i : objs) {
      i.render();
    }
    popMatrix();
  }


  void setSize(int w, int h) {
    dx = (width/2)-(w/2);
    dy = (height/2)-(h/2);
    dx2 = (width/2)+(w/2);
    dy2 = (height/2)+(h/2);
    this.w = w;
    this.h = h;
  }

  void newCanvas() {
    objs.add(new Thing(dx, dy, w, h, 255));
  }

  void del() {
    objs.removeAll(objs);
  }
}

class Thing {
  int x1, x2, y1, y2,r;
  color c;
  PImage img;

  Thing(int x1, int x2, int y1, int y2, PImage img) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.img = img;
  }

  Thing() {
    this.x1 = 0;
    this.y1 = 0;
    this.x2 = m.c.w;
    this.y2 = m.c.h;
    this.img = new PImage(x2,y2);
  }

  Thing(int x1, int x2, int y1, int y2, color c) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.c = c;
    this.img = new PImage();
    rec(x1, x2, y1, y2, c);
    pushMatrix();
    translate(x2,y2);
    this.img = get(x1, y1, x2, y2);
    popMatrix();
  }
  
  Thing(int x1, int y1, int r, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.r = r;
    this.c = c;
    this.img = new PImage();
    fill(c);
    stroke(c);
    ellipse(x1,y1,r,r);
    this.img = get(0, 0, width/2, height/2);
  }

  void render() {
    image(img, x1, y1, x2, y2);
  }
  
  PImage sketch(int x, int y, color c){
    PImage temp = img;
    temp.loadPixels();
    temp.pixels[(width*y)+x] = c;
    return(temp);
  }
}
