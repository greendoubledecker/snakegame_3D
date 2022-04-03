import java.util.*;

class Snake {
  ArrayList<PVector> body;
  String dir;

  Snake(int x, int y, int z) {
    body = new ArrayList<PVector>();
    body.add(new PVector(x, y, z));
    dir = "x+";
  }

  void update(int x, int y, int z) {
    body.add(0, new PVector(x, y, z));
    body.remove(body.size()-1);
  }

  PVector getPos(){
    return this.body.get(0);  
  }

  void draw() {
    stroke(200);
    fill(255);
    for (int i = 0; i < body.size(); i++) {
      pushMatrix();
      translate(body.get(i).x, body.get(i).y, body.get(i).z);
      box(10);
      popMatrix();
    }
  }
}
