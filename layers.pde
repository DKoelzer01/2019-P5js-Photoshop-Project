class Layer {
  PImage cur;
  color col, colp = 0;
  Button newLayer;
  ArrayList<Button> butt = new ArrayList();
  int curLayer = 0;
  int layNum = 0;
  Layer() {
    newLayer = new Button(width-90, height-30, width-70, height-10, 140, loadImage("assets/plus.PNG"));
  }

  void render() {
    rec(width-100, 30, width, height, 100);
    newLayer.render(loadImage("assets/plus.PNG"), "addLayer", m.layer);
    fill(180);
    text("Layer: " + layNum, width-65, height-15);
    buttonCheck();
    int i = 0;
    for (Button b : butt) {
      b.render(b);
      layNum = int(map(curLayer,0,butt.size(),butt.size(),0));
      b.txt("Layer "+ int(map(i,0,butt.size(),butt.size(),0)));
      if (b.pressed) {
        curLayer = i;
      }
      i++;
    }
  }

  void buttonCheck() {
    int count = m.c.objs.size();
    if (butt.size()-1 != count) {
       for (int i = 1; i < butt.size(); i++) {
        try {
          Button b = butt.get(i);
          buttonHov.remove(buttons.indexOf(b));
          buttons.remove(buttons.indexOf(b));
        } 
        catch(Exception e) {
        }
      }
      butt.removeAll(butt);
      for (int i = 0, h = 0; i <= count; i++, h+=30) {
        butt.add(new Button(width-90, height-60-h, width-10, height-30-h, 80));
        h+=5;
      }
    }
  }

  void addLayer() {
    m.c.objs.add(new Thing());
  }
}
