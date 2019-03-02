class MainScreen {
  Dropdown file;
  Dropdown edit;
  Dropdown filter;
  Toolbar t;
  Canvas c;
  Layer layer;
  Filters f;
  threadA lay = new threadA();
  PImage[] Tools = new PImage[11];
  String[] ToolsFuncs = {"transform", "boxselect", "brush", "colorpicker", "eraser", "gradient", "wand", "textbox", "recT", "elli", "poly"};
  String[] filea = new String[] {"Open", "Save", "New", "Exit"};
  String[] edita= new String[] {"Fill"};
  String[] filtera = new String[] {"Radial Blur", "Color Filter", "Average", "Invert", "Greyscale", "Mirror X", "Mirror Y", "Red Overlay", "Green Overlay", "Blue Overlay", "Rotate"};
  String[] fileFuncs = new String[] {"open", "commit", "newFile", "quit"};
  String[] editFuncs = new String[] {"selectionFill"};
  String[] filterFuncs = new String[] {"blur", "filt", "averageFilter", "invert", "greyscale", "mirrorXF", "mirrorYF", "fred", "fgreen", "fblue", "rotat"};

  void setB() {
    println(width, height);
    c.setSize(width/2, height/2); 
    layer = new Layer();
    c.objs.add(new Thing());
  }

  void MainScreenSetup() {
    Tools[0] = loadImage("assets/Transform.PNG");
    Tools[1] = loadImage("assets/BoxSelect.PNG");
    Tools[2] = loadImage("assets/Brush.PNG");
    Tools[3] = loadImage("assets/ColorPicker.PNG");
    Tools[4] = loadImage("assets/Eraser.PNG");
    Tools[5] = loadImage("assets/Gradient.PNG");
    Tools[6] = loadImage("assets/MagicWand.PNG");
    Tools[7] = loadImage("assets/Text.PNG");
    Tools[8] = loadImage("assets/rec.PNG");
    Tools[9] = loadImage("assets/ellipse.PNG");
    Tools[10] = loadImage("assets/poly.PNG");
    this.c = new Canvas();
    this.t = new Toolbar(Tools, ToolsFuncs);
    this.file = new Dropdown(5, 5, 35, 20, filea, 180, fileFuncs);
    this.edit = new Dropdown(40, 5, 70, 20, edita, 180, editFuncs);
    this.filter = new Dropdown(75, 5, 115, 20, filtera, 180, filterFuncs);
    lay.start();
    m.f = new Filters();
  }

  void render() {
    background(120);
    rec(0, 0, width-1, 30, 200);
    if (frameRate > 40) {
      fill(0, 255, 0);
    } else if (frameRate > 20) {
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    text(round(frameRate), width-30, 16);
    noStroke();
    rec(width-90, 40, width-10, 120, loadImage("assets/rgb.png"), 100);
    try {
      layer.render();
      t.toolWrapper();
    } 
    catch(Exception e) {
    }
    c.render();
    t.render();
    f.render();

    file.render("File", i);
    edit.render("Edit", m);
    filter.render("Filter", f);
  }
}
