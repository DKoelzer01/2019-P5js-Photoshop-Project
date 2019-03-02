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

class threadB {
  CountDownLatch latch;
  int x1, x2, y1, y2;
  
  void run() {
    rec(x1, y1, x2, y2, m.layer.col);
  }
  
  void push(int a, int b) {
    if (x1 != 0) {
      x2 = a;
      y2 = b;
    } else {
      x1 = a;
      y1 = b;
    }
  }
}
