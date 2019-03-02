class Toolbar {
  PImage[] sprites;
  String[] toolsFuncs;
  ArrayList<Button> Tools;
  int x0,y0;
  Boolean trans, sel, bru, col, era, grad, wand, tex, recT, elli, poly, shift, ctrl;
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
    if (mouseX>0 && mouseX<80 && mouseY>0&& mouseY<height-100) {
      ctrl = true;
    } else {
      ctrl = false;
    }
    rec(0, 30, 50, height, 140);
    for (int i = 0; i < Tools.size(); i++) {
      Tools.get(i).render(this.sprites[i], toolsFuncs[i], this);
    }
  }

  void toolWrapper() {
    if (trans) {
      ellipse(45, 55, 4, 4);
      if (mousePressed && !m.t.ctrl) {
        (m.c.objs.get(m.layer.curLayer).x1) = mouseX - m.c.w;
        (m.c.objs.get(m.layer.curLayer).y1) = mouseY - m.c.h;
      }
      if (keyCode == ENTER) {
        keyCode = 0;
        trans = false;
        PImage temp = m.c.objs.get(m.layer.curLayer).img.get(m.c.dx,m.c.dy,m.c.w,m.c.h);
        m.c.objs.get(m.layer.curLayer).img = temp;
      }
    }
    if (sel) {
      ellipse(45, 90, 4, 4);
    }
    if (bru) {
      ellipse(45, 125, 4, 4);
      if (mousePressed) {
        m.c.objs.get(m.layer.curLayer).sketch(mouseX, mouseY);
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
    }
    if (elli) {
      ellipse(45, 370, 4, 4);
    }
    if (poly) {
      ellipse(45, 405, 4, 4);
    }

    rec(10, height-10, 50, height-50, m.layer.colp);
    rec(30, height-30, 70, height-70, m.layer.col);
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
