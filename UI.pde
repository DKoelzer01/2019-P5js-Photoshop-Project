class Button {
  java.lang.reflect.Method meth;
  int x1, x2, y1, y2, r, g, b, val, p;
  color c;
  boolean pressed;
  String func;
  PImage img;

  Button(int x1, int y1, int x2, int y2, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.c = c;
    this.r = round(red(c));
    this.g = round(green(c));
    this.b = round(blue(c));
    this.p = 0;
    buttons.add(this);
    buttonHov.add(0);
  }
  Button(int x1, int y1, int x2, int y2, color c, int val) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.c = c;
    this.r = round(red(c));
    this.g = round(green(c));
    this.b = round(blue(c));
    this.val = val;
    this.p = 0;
    buttons.add(this);
    buttonHov.add(0);
  }
  Button(int x1, int y1, int x2, int y2, color c, PImage img) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.c = c;
    this.r = round(red(c));
    this.g = round(green(c));
    this.b = round(blue(c));
    this.img = img;
    this.p = 0;
    buttons.add(this);
    buttonHov.add(0);
  }




  void render() {
    buttonHov.set(buttons.indexOf(this), 0);
    rec(this.x1, this.y1, this.x2, this.y2, this.c);
    if ((mouseX >= x1 && mouseX <= x2) && (mouseY >= y1 && mouseY <= y2)) {
      rec(x1, y1, x2, y2, color(this.r+100, this.g+100, this.b+100));
      buttonHov.set(buttons.indexOf(this), 1);
    }
  }

  void render(PImage img, String func, Object obj) {
    if ((mouseX >= x1 && mouseX <= x2) && (mouseY >= y1 && mouseY <= y2)) {
      buttonHov.set(buttons.indexOf(this), 1);
    }
    render(func, obj);
    rec(this.x1, this.y1, this.x2, this.y2, img, 100);
  }

  void render(String func) {
    render();
    if (this.pressed) {
      thread(func);
    }
  }
  void render(String func, Object obj) {
    render();
    if (this.pressed) {
      try {
        meth = obj.getClass().getMethod(func);
      } 
      catch (SecurityException e) {
      }
      catch (NoSuchMethodException e) {
      }
      try {
        meth.invoke(obj);
      } 
      catch (IllegalArgumentException e) {
      }
      catch (IllegalAccessException e) {
      }
      catch (InvocationTargetException e) {
      }
      this.pressed = false;
    }
  }

  void txt(String tex) {
    fill(0);
    text(tex, this.x1+5, this.y1+((this.y2-this.y1)/2)+5);
  }
}

class Dropdown {
  Object obj;
  int x1, x2, y1, y2, max, cur;
  color c;
  String[] data, funcs, args;
  Button drop;
  Boolean toggleT, toggle;

  ArrayList<Button> droplist = new ArrayList();

  Dropdown(int x1, int y1, int x2, int y2, String[] dataNames, color c, String[] funcs) {
    this.funcs = funcs;
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.c = c;
    this.toggleT = false;
    this.toggle = false;
    this.data = dataNames;
    drop = new Button(x1, y1, x2, y2, c);
    for (int i = 0; i < dataNames.length; i++) {
      this.cur = dataNames[i].length();
      if (this.cur > this.max) {
        this.max = this.cur;
      }
    }
    for (int i = 1; i < dataNames.length+1; i++) {
      droplist.add(new Button(x1, y1+(i*15), (this.max*8)+x1+10, y2+(i*15), c+60, i-1));
    }
  }

  Dropdown(int x1, int y1, int x2, int y2, String[] dataNames, color c, String[] funcs, Object obj) {
    this.obj = obj;
    this.funcs = funcs;
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.c = c;
    this.toggleT = false;
    this.toggle = false;
    this.data = dataNames;
    drop = new Button(x1, y1, x2, y2, c);
    for (int i = 0; i < dataNames.length; i++) {
      this.cur = dataNames[i].length();
      if (this.cur > this.max) {
        this.max = this.cur;
      }
    }
    for (int i = 1; i < dataNames.length+1; i++) {
      droplist.add(new Button(x1, y1+(i*15), (this.max*8)+x1+10, y2+(i*15), c+60, i-1));
    }
  }

  void render(String input) {
    this.drop.render();
    this.drop.txt(input);
    if (toggleT) {
      this.toggle = !this.toggle;
      this.toggleT = false;
    }
    if (this.toggle) {
      int i = 0;
      for (Button part : droplist) {
        if (Stage == "Launcher") {
          part.render();
          part.txt(data[i]);
        } else {
          part.render(this.funcs[i]);
          part.txt(data[i]);
        }
        if (part.pressed) {
          wtemp = l.resXList[part.val];
          htemp = l.resYList[part.val];
          l.cur = part.val;
        }
        i++;
      }
    }
  }
  void render(String input, Object obj) {
    this.drop.render();
    this.drop.txt(input);
    if (toggleT) {
      this.toggle = !this.toggle;
      this.toggleT = false;
    }
    if (this.toggle) {
      int i = 0;
      for (Button part : droplist) {
        if (Stage == "Launcher") {
          part.render();
          part.txt(data[i]);
        } else {
          part.render(this.funcs[i], obj);
          part.txt(data[i]);
        }
        if (part.pressed && Stage == "Launcher") {
          wtemp = l.resXList[part.val];
          htemp = l.resYList[part.val];
          l.cur = part.val;
        } else if (part.pressed && Stage != "Launcher") {
        }
        i++;
      }
    }
  }
}
