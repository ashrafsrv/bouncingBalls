

public class Ball{
  int radius;
  PVector position;
  PVector velocity;
  PImage texture;
  PShape shape;
  private final float friction = 0.99;
  private final float gravity = 0.1;
  private final float threshold = 0.1;
  
  Ball(PImage texture, float x, float y, float z, int radius){
    this.radius = radius;
    this.position = new PVector(x, y, z);
    PVector temp = PVector.random3D();
    this.velocity = temp.mult(4);
    this.texture = texture;
    this.shape = createShape(SPHERE, this.radius);
    this.shape.setTexture(texture);
    this.shape.setStroke(false);
  }
  
  PVector position(){
    return this.position;
  }
  
  PVector velocity(){
    return this.velocity;
  }
  
  void move(){
    
    if(this.position.x + this.radius > width || this.position.x - this.radius < 0){
      velocity.x *= -1;
    }
    
    if(this.position.y + this.radius > height || this.position.y - this.radius < 0){
      
      if(this.position.y + this.radius > height && Math.abs(velocity.y) < this.threshold){
        velocity.y = 0;
      }
      else{
        velocity.y *= -1;
        velocity.y += this.gravity;
      }
      
    }
    
    if(this.position.z + this.radius < -400 || this.position.z + this.radius > 100){
      velocity.z *= -1;
    }
    
    
    // Add velocity to the position of the ball
    this.position.add(velocity);
    
    // Add gravity to the y-velocity, and friction to everything
    velocity.y += this.gravity;
    velocity.y *= this.friction;
    velocity.x *= this.friction;
    velocity.z *= this.friction; 
    
  }
  void display(){
    pushMatrix();
    translate(position.x, position.y, position.z);
    
    shape(this.shape);
    popMatrix();
  }
}
