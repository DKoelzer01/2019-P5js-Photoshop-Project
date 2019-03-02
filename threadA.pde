class threadA extends Thread {
  boolean yee = false;
  @Override
    void run() {
    while (Stage != "Main" || yee) {
      delay(5);
    }
    println("Loading...");
    delay(round(frameRate/.6));
    m.setB();
  }
}
