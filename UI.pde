class Button {
  int x1, x2, y1, y2, r, g, b;
  color c;
  boolean pressed;

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
}

class Dropdown {
  int x1,x2,y1,y2;
  color c;
  
  Dropdown(int x1, int y1, int x2, int y2, String[] dataNames, color c) {
    rec(x1,y1,x2,y2,c);
    for (int i = 1; i < dataNames.length+1; i++) {
      rec(x1,y1+(i*15),x2,y2+(i*15)-5,c+60);
    }
  }

  void render() {
  
  }
}
