class Frame {
  PApplet parent;
  Frame(PApplet p) {
   this.parent = p;
  }
}

class IO {
  File selection;
  void open() {
    selectInput("Choose a file to open:", "fileLoaded",selection);
  }

  void commit() {
    selectOutput("Choose a file to write to:", "fileSaved",selection);
  }

  void newFile() {
    m.c.del();
    m.c.newCanvas();
  }

  void quit() {
    exit();
  }

}
