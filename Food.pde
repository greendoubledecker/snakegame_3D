class Food{
  PVector pos;   
  Food(){
    this.pos = new PVector(floor(random(-20, 20)) * 10, floor(random(-20, 20)) * 10, floor(random(-20, 20)) * 10);
    //this.pos = new PVector(x, y, z);
  }
  
  void draw() {
    pushMatrix();
    fill(0, 255, 0);
    noStroke();
    translate(this.pos.x, this.pos.y, this.pos.z);
    box(10);
    popMatrix();
  }
}
