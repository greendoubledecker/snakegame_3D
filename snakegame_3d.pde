import peasy.*;

PeasyCam cam;
Snake snake;
Food food;
int z;
int y;
int x;
PVector prev;
//int difficulty = 1;

void setup() {
  size(400, 400, P3D);
  frameRate(100);
  cam = new PeasyCam(this, 500);
  snake = new Snake(-200, -200, -200);
  food = new Food();
  println (food.pos);
  z = -200;  
  y = -200;
  x = -200;
}

void draw() {
  background(0);
  prev = snake.body.get(snake.body.size() - 1);
  // fill(255, 0, 0);
  noFill();
  box(400);
  food.draw();
  snake.draw();
  switch (snake.dir) {
    case "x+":
    //println("dir: x+");
    if (x < 200) {
      x += 10;
    } else if (x >= 200 && y < 200) {
      if ((z / 10) % 2 == 0) {
        snake.dir = "y+";
        y += 10;
      } else {
          snake.dir = "y-";
          y -= 10;
      } 
    } else {
        snake.dir = "z+";
        z += 10;
    }
    break;
    case "x-":
    //println("dir: x-");
    if (x > -200) {
      x -= 10;
    } else if (x <= -200 && y < 200) {
      if ((z / 10) % 2 == 0) {
        snake.dir = "y+";
        y += 10;
      } else {
        if (y > -200) {
          snake.dir = "y-";
          y -= 10;
        }
        else {
          snake.dir = "z+";
          z += 10;
        }
      }
    } else {
      snake.dir = "y-";
      y -= 10;
    }
    break;
    case "y+":
    //println("dir: y+");
    if (x >= 200 && y <= 200) {
      snake.dir = "x-";
      x -= 10;
    } else if (x <= -200 && y <= 200) {
      snake.dir = "x+";
      x += 10;
    }
    break;
    case "y-":
    //println("dir: y-");
    if (x <= -200 && y <= 200){
      snake.dir = "x+";
      x += 10;
    } else if (x == 200 && y >= -200) {
     snake.dir = "x-";
     x -= 10;
    }
    break;
    case "z+":
    //println("dir: z+");
    if (z < 200 && x >= 200) {
      snake.dir = "x-";
      x -= 10;
    } else if (z < 200 && x <= -200) {
      snake.dir = "x+";
      x += 10;      
    }
    break;
    case "z-":
    //println("dir: z-");
    break;
  }
  if (x == 210){
   x = -200;
  } else if (y == 210){
   y = -200;
  } else if (z == 200){
   z = -200;
  } else if (x == -210){
   x = 200;
  } else if (y == -210){
   y = 200;
  } else if (z == -210){
   z = 200;
  }
  snake.update(x, y, z);
  if (snake.getPos().x == food.pos.x && snake.getPos().y == food.pos.y && snake.getPos().z == food.pos.z){
    food = new Food();
    snake.body.add(prev);
  }
  //println("coordinates: (" + x + " , " + y + " , " + z + ")");
  println("Length: " + snake.body.size());
  println(food.pos);
}











//whitespace
