
// TILE CLASS

class Tile {
  
  // Globals
  int index;
  int x, y, w, h;
  boolean banged = false;

  Tile(int _index) {
    index = _index;
    x = index * TILE_WIDTH;
    y = 0;
    w = TILE_WIDTH;
    h = TILE_HEIGHT;
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
