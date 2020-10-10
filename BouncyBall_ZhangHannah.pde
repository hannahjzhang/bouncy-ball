// "Ball" is the class; "ball" is the object
Ball ball;
Ball ball2;

// Constants
final int LEFT_EDGE = 0;
final int TOP_EDGE = 0;
final int RIGHT_EDGE = 1024;
final int BOTTOM_EDGE = 768;

void setup() {
  // Can't use RIGHT_EDGE and BOTTOM_EDGE here; wish Processing
  // were more sensible regarding constants
  size(1024, 768);
  // When we draw balls, do so from their centers
  ellipseMode(RADIUS);
  ball = new Ball(100, 200, 100, new PVector(4,-2), 0, color(#ff0000));
  ball2 = new Ball(300, 200, 100, new PVector(7, 3), 0, color(#308BCE));
}

void draw() {
  background(#ffffff);          // white
 // translate(width/2, height/2); // draw from center of window
  
  ballsMove();   // Move all bouncy balls
  ballsDraw();   // Tell all bouncy balls to draw themselves
  //ballsBounce(); // Tells bouncy balls to bounce we they run into a wall
}

// Move all bouncy balls; this is different from drawing.
// This method changes (x,y) coordinates of the balls, it
// does not render them in the display.
// as soon as it moves, checks for collision
public void ballsMove() {
  ball.move();
  ball2.move();
  ballsBounce();
  collision();
}

// Tell all bouncy balls to draw themselves and bounce
public void ballsDraw() {
  ball.draw();
  ball2.draw();
}

public void ballsBounce() {
  ball.bounce();
  ball2.bounce();
}

  public void collision() {
    if (ball.getRadius() + ball2.getRadius() >= ball.distance(ball2))
    {
      ball.changeDirection();
      ball.changeColor();
      ball2.changeDirection();
      ball2.changeColor();
    }
  }
