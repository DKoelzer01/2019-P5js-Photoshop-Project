class Canvas {
  ArrayList<Thing> objs = new ArrayList();

  void render() {
    rec(width/4, height/4, (3*width)/4, (3*height)/4, 0);
    pushMatrix();
    translate(width/4, height/4);
    for (Thing i : objs) {
      i.render();
    }
    popMatrix();
  }

  void newCanvas() {
    objs.add(new Thing(0, 0, width/2, height/2, 255));
  }

  void del() {
    objs.removeAll(objs);
  }
}

class Thing {
  int x1, x2, y1, y2;
  color c;
  PImage img;

  Thing(int x1, int x2, int y1, int y2, PImage img) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.img = img;
  }

  Thing(int x1, int x2, int y1, int y2, color c) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.c = c;
  }
  void render() {
    if (this.img == null) {
      rec(x1, x2, y1, y2, c);
    } else {
      image(img, x1, y1,x2,y2);
    }
  }
}
