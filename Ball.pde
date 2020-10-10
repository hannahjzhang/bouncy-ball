// Use the PVector to change the x and y coordinates when needed 

class Ball {
  private float radius;     // radius of bouncy ball
  private float x;          // x-coordinate of center
  private float y;          // y-coordinate of center
  private PVector vector;   // direction and magnitude of movement
  private final int id;     // each ball has its own identifier
  private color fillColor;  // color of ball
  
  // Constructor used to store ball information
  public Ball(float x, float y, float radius, PVector vector, int id, color c) {
    this.x = x;
    this.y = y;
    this.vector = vector;
    this.radius = radius;
    this.id = id;
    this.fillColor = c;
  }
  
  // Four of the fields are mutable: x, y, radius, v
  public float getX() { return x; }
  public float getY() { return y; }
  public float getRadius() { return radius; }
  public PVector getvector() { return vector; }
  public int getID() { return id; }
  public color getColor() { return fillColor; }

  public void setX(int x) { this.x = x; }
  public void setY(int y) { this.y = y; }
  
  public float distance(Ball other) {
    return (float) Math.sqrt(square(getX()-other.getX()) + square(getY()-other.getY()));
  }
  
  public boolean intersectsVertical() {
    // Note constants at start of Bouncy_Ball_Starter_Kit
    // LEFT_EDGE and RIGHT_EDGE
    //
    // Return true if ball touching either left or right edge

   if (x + radius > RIGHT_EDGE || x - radius < LEFT_EDGE)
      return true;
    else
      return false;  // stub
  }
  
  public boolean intersectsHorizontal() {
    // Note constants at start of Bouncy_Ball_Starter_Kit
    // BOTTOM_EDGE and TOP_EDGE
    //
    // Return true if ball touching either top or bottom edge

    if (y - radius <= TOP_EDGE || y + radius >= BOTTOM_EDGE)
      return true;
    else
      return false;  // stub
  }
  
  public void move() {
    // Move the ball
    x = x + vector.x; // The vector tells the ball how to change location
    y = y + vector.y;
  }
  
  public void bounce() {
    // Check to see if ball intersects edge; if so bounce
    
    if (intersectsVertical()) {
      vector.x = -1 * vector.x;
    }
    
    if (intersectsHorizontal()) {
      vector.y = -1 * vector.y;
    }
  }
  
  public void changeDirection() {
      vector.x = -1 * vector.x;
      vector.y = -1 * vector.y;
  }
  
  public void changeColor() {
    fillColor = color(random(255), random(255), random(255)); 
  }
    
    
  public void draw() {
    fill(fillColor);
    stroke(#000000);
    ellipse(x, y, radius, radius);
  }
}
