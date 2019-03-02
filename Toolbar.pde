class Toolbar {
  PImage[] sprites;
  String[] toolsFuncs;
  threadB rectThread;
  ArrayList<Button> Tools;
  int x0, y0;
  Boolean trans, sel, bru, col, era, grad, wand, tex, recT, elli, poly, shift, ctrl, ctrl2, transCheck;
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
    if (keyPressed && key == CODED && keyCode == SHIFT) {
      shift = true;
    } else {
      shift = false;
    }
    if (mouseX > width-100 ) {
      ctrl2 = true;
    } else {
      ctrl2 = false;
    }
    if (mouseX < 80 || mouseY < 30) {
      ctrl = true;
    } else {
      ctrl = false;
    }
    rec(0, 30, 50, height, 140);
    for (int i = 0; i < Tools.size(); i++) {
      Tools.get(i).render(this.sprites[i], toolsFuncs[i], this);
    }
    transCheck = ctrl || ctrl2;
  }



  void toolWrapper() {
    if (trans) {
      ellipse(45, 55, 4, 4);
      if (mousePressed && !transCheck) {
        (m.c.objs.get(m.layer.curLayer).x1) = mouseX - m.c.w;
        (m.c.objs.get(m.layer.curLayer).y1) = mouseY - m.c.h;
      }
      if (keyCode == ENTER) {
        keyCode = 0;
        trans = false;
        PImage temp = m.c.objs.get(m.layer.curLayer).img.get(0, 0, m.c.w, m.c.h);
        m.c.objs.get(m.layer.curLayer).img = temp;
      }
    }
    if (sel) {
      ellipse(45, 90, 4, 4);
    }
    if (bru) {
      ellipse(45, 125, 4, 4);
      if (mousePressed) {
        m.c.objs.get(m.layer.curLayer).img = m.c.objs.get(m.layer.curLayer).sketch(round(mouseX), round(mouseY), m.layer.col);
      }
    }
    if (col) {
      ellipse(45, 160, 4, 4);
    }
    if (era) {
      ellipse(45, 195, 4, 4);
    }
    if (grad) {
      ellipse(45, 230, 4, 4);
    }
    if (wand) {
      ellipse(45, 265, 4, 4);
    }
    if (tex) {
      ellipse(45, 300, 4, 4);
    }
    if (recT) {
      ellipse(45, 335, 4, 4);
      rectThread = new threadB();
    }
    if (elli) {
      ellipse(45, 370, 4, 4);
    }
    if (poly) {
      ellipse(45, 405, 4, 4);
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
    recT=false;
    elli=false;
    poly=false;
  }

  void transform() {
    if (!shift) {
      reset();
      trans = true;
    }
  }

  void boxselect() {
    if (!shift) {
      reset();
      sel = true;
    }
  }

  void brush() {
    if (!shift) {
      reset();
      bru = true;
    }
  }

  void colorpicker() {
    if (!shift) {
      reset();
      col = true;
    }
  }

  void eraser() {
    if (!shift) {
      reset();
      era = true;
    }
  }

  void gradient() {
    if (!shift) {
      reset();
      grad = true;
    }
  }

  void wand() {
    if (!shift) {
      reset();
      wand = true;
    }
  }

  void textbox() {
    if (!shift) {
      reset();
      tex = true;
    }
  }
  void elli() {
    if (!shift) {
      reset();
      elli = true;
    }
  }

  void poly() {
    if (!shift) {
      reset();
      poly = true;
    }
  }
  void recT() {
    if (!shift) {
      reset();
      recT = true;
    }
  }
}
