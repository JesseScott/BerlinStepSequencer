
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
public static final int TILE_WIDTH = 200; // 720
public static final int TILE_HEIGHT = 200; // 540


// SCREEN

public void init() {
  frame.removeNotify();
  frame.setUndecorated(false);
  frame.addNotify();
  super.init();
}

// SETUP

void setup() {
  
  // Screen
  size(TILE_WIDTH * NUM_STEPS, TILE_HEIGHT);
  //frame.setLocation(0 - (TILE_WIDTH * NUMBER_OF_ROWS), 0);
  
  // OSC
  osc = new OscP5(this, 8888);
  net = new NetAddress("127.0.0.1", 9999);
  OscMessage msg = new OscMessage("/num_steps");
  msg.add(NUM_STEPS);
  osc.send(msg, net);
  
  //  Tiles
  tiles = new Tile[NUM_STEPS];
  for(int i = 0; i < tiles.length; i++) {
    tiles[i] = new Tile(i); 
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



