class Layer {
  PImage cur;
  color col, colp;
  Button newLayer;
  ArrayList<Button> butt = new ArrayList();
  int curLayer = 0;

  Layer() {
    newLayer = new Button(width-90, height-30, width-70, height-10, 140, loadImage("assets/plus.PNG"));
  }

  void render() {
    rec(width-100, 30, width, height, 100);
    newLayer.render(loadImage("assets/plus.PNG"),"addLayer",m.layer);
    text("Layer: " + curLayer, width-90, 20);
    int count = m.c.objs.size();
    buttonCheck();
    for (int i = 0; i < count; i++) {
      Button b = butt.get(i);
      b.render();
      b.txt("Layer "+(i+1));
      if (b.pressed) {
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
