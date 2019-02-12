class Button {
  int x1, x2, y1, y2;
  color c;
  boolean pressed;

  Button(int x1, int y1, int x2, int y2, color c) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.c = c;
  }

  void render() {
    rec(this.x1, this.y1, this.x2, this.y2, this.c);
    if ((mouseX >= x1 && mouseX <= x2) && (mouseY >= y1 && mouseY <= y2)) {
      rec(x1, y1, x2, y2, c+100);
      if (mousePressed) {
        pressed = true;
      } else {
        pressed = false;
      }
    }
  }
}
