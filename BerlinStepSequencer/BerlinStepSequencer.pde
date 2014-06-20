
/*

  A step sequencer based off of data from different cities named Berlin
  
  LGPL V2 and shit
  
  https://github.com/JesseScott/BerlinStepSequencer

*/



// IMPORTS

import oscP5.*;
import netP5.*;
import java.awt.Frame;

// INSTANCES

OscP5 osc;
NetAddress net;
Tile[] tiles;

// VARIABLES

public static final int NUM_STEPS = 4;
public static final int NUMBER_OF_ROWS = 2;
public static final int NUMBER_OF_COLS = 2;
public static final int TILE_WIDTH = 720; // 720
public static final int TILE_HEIGHT = 540; // 540
boolean debugLayout = false;


// SCREEN

public void init() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}

// SETUP

void setup() {
  
  // Screen
  size(TILE_WIDTH * NUMBER_OF_ROWS, TILE_HEIGHT * NUMBER_OF_COLS, P2D);
  frame.setLocation(0 - (TILE_WIDTH * NUMBER_OF_ROWS), 0);
  //frame.setLocation(50, 50);
  
  // OSC
  osc = new OscP5(this, 8888);
  net = new NetAddress("127.0.0.1", 9999);
  OscMessage msg = new OscMessage("/num_steps");
  msg.add(NUM_STEPS);
  osc.send(msg, net);
  
  //  Tiles
  tiles = new Tile[NUM_STEPS];
  for(int i = 0; i < tiles.length; i++) {
    int x = TILE_WIDTH  * (i % 2);
    int y = TILE_HEIGHT * (((i/2) % 2) % (tiles.length/2));
    tiles[i] = new Tile(i, x, y); 
    tiles[i].setup();
  }
  
}




// DRAW

void draw() {
  
  // Fade BG
  fill(0, 25);
  rect(0, 0, width, height);
  
  for(int i = 0; i < tiles.length; i++) {
    tiles[i].draw();
  }
  
  
}



