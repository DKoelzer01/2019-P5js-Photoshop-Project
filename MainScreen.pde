class MainScreen {
  Dropdown file;
  Dropdown edit;
  Dropdown filter;
  PImage[] Tools = new PImage[8];
  String[] ToolsFuncs = {"transform","boxselect","brush","colorpicker","eraser","gradient","wand","textbox"};

  Toolbar t;
  Canvas c;
  String[] filea = new String[] {"Open", "Save", "New", "Exit"};
  String[] edita= new String[] {"Transform", "Paste", "Fill"};
  String[] filtera = new String[] {"Radial Blur", "Color Filter", "Average", "Invert", "Greyscale"};
  String[] fileFuncs = new String[] {"open","commit","newFile","quit"};
  String[] editFuncs = new String[] {"trans","paste","selectionFill"};
  String[] filterFuncs = new String[] {"blur","filt","averageFilter","invert","greyscale"};
  
  void MainScreenSetup() {
    Tools[0] = loadImage("assets/Transform.PNG");
    Tools[1] = loadImage("assets/BoxSelect.PNG");
    Tools[2] = loadImage("assets/Brush.PNG");
    Tools[3] = loadImage("assets/ColorPicker.PNG");
    Tools[4] = loadImage("assets/Eraser.PNG");
    Tools[5] = loadImage("assets/Gradient.PNG");
    Tools[6] = loadImage("assets/MagicWand.PNG");
    Tools[7] = loadImage("assets/Text.PNG");
    this.c = new Canvas();
    this.t = new Toolbar(Tools,ToolsFuncs);
    this.file = new Dropdown(5, 5, 35, 20, filea, 180, fileFuncs);
    this.edit = new Dropdown(40, 5, 70, 20, edita, 180, editFuncs);
    this.filter = new Dropdown(75, 5, 115, 20, filtera, 180, filterFuncs);
  }

  void render() {
    background(120);
    rec(0, 0, width-1, 30, 200);
    t.render();
    file.render("File",i);
    edit.render("Edit",m);
    filter.render("Filter",f);
    c.render();
  }
}
