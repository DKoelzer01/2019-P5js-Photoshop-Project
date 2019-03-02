class Filters {
  PImage canvas;
  PImage out;
  PImage temp;

  String[] colorFilterTags = {"Red", "Green", "Blue"};
  String[] colorFilterFuncs = {"Rad", "Rad", "Rad"};
  Rotate rot;
  GrayScale gray;
  ColorFilter red;
  ColorFilter green;
  ColorFilter blue;
  RadialBlur blur;
  Average avg;
  MirrorX mirX;
  MirrorY mirY;
  Invert inv;
  Dropdown colorFilters;

  Filters() {
    canvas = get(m.c.dx, m.c.dy, m.c.w, m.c.h);
    canvas.loadPixels();
    rot = new Rotate();
    gray = new GrayScale();
    red = new ColorFilter(0);
    green = new ColorFilter(1);
    blue = new ColorFilter(2);
    blur = new RadialBlur();
    avg = new Average();
    mirX = new MirrorX();
    mirY = new MirrorY();
    inv = new Invert();
  }

  void render() {
    canvas = get(m.c.dx, m.c.dy, m.c.w, m.c.h);
    canvas.loadPixels();
  }
  void rotat() {
    reset();
    temp = rot.exe(canvas);
    push();
  }

  void fred() {
    reset();
    temp = red.exe(canvas);
    push();
  }

  void fgreen() {
    reset();
    temp = green.exe(canvas);
    push();
  }

  void fblue() {
    reset();
    temp = blue.exe(canvas);
    push();
  }
  void mirrorXF() {
    reset();
    temp = mirX.exe(canvas);
    push();
  }

  void mirrorYF() {
    reset();
    temp = mirY.exe(canvas);
    push();
  }
  void blur() {
    reset();
    temp = blur.exe(canvas, 5);
    push();
  }

  void filt() {
    reset();
    colorFilters.toggleT = !colorFilters.toggleT;
    push();
  }

  void averageFilter() {
    reset();
    temp = avg.exe(canvas);
    push();
  }

  void invert() {
    reset();
    temp = inv.exe(canvas);
    push();
  }

  void greyscale() {
    reset();
    temp = gray.exe(canvas);
    push();
  }

  void push() {
    m.c.objs.clear();
    m.c.objs.add(new Thing(0, m.c.w, 0, m.c.h, temp));
  }

  void reset() {
    canvas = get(m.c.dx, m.c.dy, m.c.w, m.c.h);
    canvas.loadPixels();
    rot = new Rotate();
    gray = new GrayScale();
    red = new ColorFilter(0);
    green = new ColorFilter(1);
    blue = new ColorFilter(2);
    blur = new RadialBlur();
    avg = new Average();
    mirX = new MirrorX();
    mirY = new MirrorY();
    inv = new Invert();
  }
}
//m.c.objs.set(m.layer.curLayer, new Thing(m.c.objs.get(m.layer.curLayer).x1,m.c.objs.get(m.layer.curLayer).y1,m.c.objs.get(m.layer.curLayer).x2,m.c.objs.get(m.layer.curLayer).y2,out));
