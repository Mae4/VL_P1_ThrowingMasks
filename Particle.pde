class Particle 
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) 
  {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 150.0;
  }

  void run() 
  {
    update();
    display();
  }

  // Method to update position
  void update() 
  {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  void display() 
  {
    stroke(255, lifespan);
    fill(255, lifespan);
    fill(90,255,90);
    ellipse(position.x, position.y, 5, 5);   // Controls sizes of the particles
  }

  // Is the particle still useful?
  boolean isDead() 
  {
    if (lifespan < 0.00) 
    {
      return true;
    } else 
    {
      return false;
    }
  }
}
