class Layer {
  PImage cur;
  color col,colp;
  Button newLayer;
  ArrayList<Button> butt = new ArrayList();
  int curLayer = 0;
  
  Layer() {
    newLayer = new Button(90, 30, 60, 60, 140,loadImage("assets/plus.PNG"));
  }

  void render() {
    text("Layer: " + curLayer,width-90, 20);
    newLayer.render("addLayer", m.layer);
    rec(width-100, 30, width, height, 100);
    int count = m.c.objs.size();
    buttonCheck();
    for (int i = 0; i < count; i++) {
      butt.get(i).render();
      butt.get(i).txt("Layer "+(i+1));
    }
    for (int i = 0; i < butt.size();i++) {
      if(butt.get(i).pressed) {
        curLayer = i;
      }
    }
  }

  void buttonCheck() {
    int count = m.c.objs.size();
    if (butt.size() != count) {
      butt.clear();
      for (int i = 0; i < count; i++) {
        butt.add(new Button(width-90, height-30-(i*30), width-10, height-60-(i*30), 80));
      }
    }
  }

  void empty() {
    cur = null;
  }

  void addLayer() {
    m.c.objs.add(new Thing());
  }
}
