class Button {
  int x1, x2, y1, y2, r, g, b, val;
  color c;
  boolean pressed;
  String func;

  Button(int x1, int y1, int x2, int y2, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.c = c;
    this.r = round(red(c));
    this.g = round(green(c));
    this.b = round(blue(c));
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
  }
  
  void render() {
    rec(this.x1, this.y1, this.x2, this.y2, this.c);
    if ((mouseX >= x1 && mouseX <= x2) && (mouseY >= y1 && mouseY <= y2)) {
      rec(x1, y1, x2, y2, color(this.r+100, this.g+100, this.b+100));
      if (mousePressed) {
        pressed = true;
      } else {
        pressed = false;
      }
    }    
  }
  void render(String func) {
    render();
    if (this.pressed) {
    thread(func);
    }
  }
  
  void txt(String tex) {
    fill(0);
    text(tex,this.x1+5,this.y1+((this.y2-this.y1)/2)+5); 
  }
}

class Dropdown {
  int x1, x2, y1, y2;
  color c;

  ArrayList<Button> droplist = new ArrayList();
  Dropdown(int x1, int y1, int x2, int y2, String[] dataNames, color c) {
    rec(x1, y1, x2, y2, c);
    int i;
    for (i = 1; i < dataNames.length+1; i++) {
      droplist.add(new Button(x1, y1+(i*15), x2, y2+(i*15)-5, c+60, i-1));
    }
    i = 0;
    for (Button part : droplist) {
      part.render();
      text(dataNames[i], x1, y1+((i*15)+27));
      if (part.pressed) {
        wtemp = l.resXList[part.val];
        htemp = l.resYList[part.val];
        l.cur = part.val;
      }
      i++;
    }
  }

  void render() {
  }
}
