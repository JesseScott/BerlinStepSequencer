
// TILE CLASS

class Tile {
  
  // Globals
  int index;
  int xpos, ypos;
  boolean banged = false;

  Tile(int _index, int _xpos, int _ypos) {
    index = _index;
    xpos = _xpos;
    ypos = _ypos;
  }
  
  void setup( ) {
    
    
  }
  
  void update() {
    
  }

  
  void draw() {
    
   if(debugLayout) {
      stroke(255, 0, 0);
      fill(0);
      rect(xpos, ypos, TILE_WIDTH, TILE_HEIGHT);
      fill(255);
      textSize(96);
      text(index, xpos + TILE_WIDTH/2, ypos + TILE_HEIGHT/2); 
    }
    else {   
      // BG
      noFill();
      stroke(255);
      rect(xpos, ypos, TILE_WIDTH-1, TILE_HEIGHT-1);
      
      // Bang
      if(banged) {
        fill(255);
        noStroke();
        ellipseMode(CORNER);
        ellipse(xpos + (TILE_WIDTH - TILE_HEIGHT)/2, ypos, TILE_HEIGHT, TILE_HEIGHT);
        banged = false;
      }
    }
    
  }

  void bang() {
    banged = true; 
  }  
  
} /* eoc */
