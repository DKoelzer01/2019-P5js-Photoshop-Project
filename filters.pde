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
    colorFilters = new Dropdown(75, 35, 115, 50, colorFilterTags, 180, colorFilterFuncs, m.c);
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
    if (m.filter.droplist.get(1).pressed) {
      colorFilters.render("Color");
    }
  }
  void rotat() {
    temp = rot.exe(canvas);
    push();
  }
  
  void fred() {
    temp = red.exe(canvas);
    push();
  }
  
  void fgreen(){
    temp = green.exe(canvas);
    push();
  }
  
  void fblue(){
    temp = blue.exe(canvas);
    push();
  }
  void mirrorXF() {
    temp = mirX.exe(canvas);
    push();
  }
  
  void mirrorYF() {
    temp = mirY.exe(canvas);
    push();
  }
  void blur() {
    temp = blur.exe(canvas, 5);
    push();
  }

  void filt() {
    colorFilters.toggleT = !colorFilters.toggleT;
    push();
  }

  void averageFilter() {
    temp = avg.exe(canvas);
    push();
  }

  void invert() {
    temp = inv.exe(canvas);
    push();
  }

  void greyscale() {
    temp = gray.exe(canvas);
    push();
  }

  void push() {
    m.c.objs.clear();
    m.c.objs.add(new Thing(0, m.c.w, 0, m.c.h, temp));
  }
}
//m.c.objs.set(m.layer.curLayer, new Thing(m.c.objs.get(m.layer.curLayer).x1,m.c.objs.get(m.layer.curLayer).y1,m.c.objs.get(m.layer.curLayer).x2,m.c.objs.get(m.layer.curLayer).y2,out));
