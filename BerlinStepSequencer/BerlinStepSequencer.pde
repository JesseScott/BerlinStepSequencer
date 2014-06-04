
/*

  A step sequencer based off of data from different cities named Berlin
  
  LGPL V2 and shit
  
  https://github.com/JesseScott/BerlinStepSequencer

*/



// IMPORTS

import org.puredata.processing.PureData;


// INSTANCES

PureData pd;
Tile[] tiles;

// VARIABLES

int NUM_STEPS = 8;





// SETUP

void setup() {
  
  // Screen
  size(1600, 200);
  
  // Pd
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("step.pd");
  for(int i = 1; i < NUM_STEPS + 1; i++) {
    String id = "Bang";
    id += i;
    pd.subscribe(id);
  }
  pd.start();
  
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
  fill(255, 25);
  rect(0, 0, width, height);
  
  for(int i = 0; i < tiles.length; i++) {
    tiles[i].draw();
  }
  
  
}


// PD

void pdPrint(String s) {
    //println("Print is " + s);
}

void receiveBang(String source) {
  println("Bang is " + source);
  
  // Parse It
  String index = source.substring(4, 5);
  int indexToBang = Integer.valueOf(index);
  indexToBang = indexToBang -1;
  
  // Bang It
  tiles[indexToBang].bang(); 
  
}

void receiveFloat(String source, float x) {
  //println("Float is " + source + "  " + x);
}

void receiveSymbol(String source, String sym) {
  //println("Symbol is " + source + "  " + sym);
}
