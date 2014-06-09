
// TILE CLASS

class Tile {
  
  // Globals
  int index;
  int x, y, w, h;
  boolean banged = false;

  Tile(int _index) {
    index = _index;
    x = index * 200;
    y = 0;
    w = 200;
    h = 200;
  }
  
  void setup( ) {
    
    
  }
  
  void update() {
    
  }

  
  void draw() {
    
    // BG
    noFill();
    stroke(255);
    rect(x, y, w-1, h-1);
    
    // Bang
    if(banged) {
      fill(255);
      noStroke();
      ellipseMode(CORNER);
      ellipse(x, y, w, h);
      banged = false;
    }
    
  }

  void bang() {
    banged = true; 
  }  
  
} /* eoc */
