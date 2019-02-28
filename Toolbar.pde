class Toolbar {
  PImage[] sprites;
  String[] toolsFuncs;
  ArrayList<Button> Tools;
  Boolean trans, sel, bru, col, era, grad, wand, tex;
  Toolbar(PImage[] input, String[] funcs) {
    this.sprites = input;
    this.toolsFuncs = funcs;
    this.Tools = new ArrayList();
    int h = 10;
    for (int i = 0; i < input.length; i++) {
      h+=30;
      Tools.add(new Button(10, h, 40, h+30, 100));
      h+=5;
    }
  }

  void render() {
    rec(0, 30, 50, height, 140);
    for (int i = 0; i < Tools.size(); i++) {
      Tools.get(i).render(this.sprites[i], toolsFuncs[i], this);
    }
  }

  void toolWrapper() {
    if (trans) {
    }
    if (sel) {
    }
    if (bru) {
      if(mousePressed) {
        fill(255);
        point(mouseX,mouseY);
      }
    }
    if (col) {
    }
    if (era) {
    }
    if (grad) {
    }
    if (wand) {
    }
    if (tex) {
    }
  }

  void reset() {
    trans=false; 
    sel=false; 
    bru=false; 
    col=false; 
    era=false; 
    grad=false; 
    wand=false; 
    tex=false;
  }

  void transform() {
    reset();
    trans = true;
  }

  void boxselect() {
    reset();
    sel = true;
  }

  void brush() {
    reset();
    bru = true;
  }

  void colorpicker() {
    reset();
    col = true;
  }

  void eraser() {
    reset();
    era = true;
  }

  void gradient() {
    reset();
    grad = true;
  }

  void wand() {
    reset();
    wand = true;
  }

  void textbox() {
    reset();
    tex = true;
  }
}
