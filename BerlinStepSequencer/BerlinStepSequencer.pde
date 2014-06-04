
/*

  a step sequencer based off of data from different cities named berlin
  
  LGPL V2 and shit
  
  https://github.com/JesseScott/BerlinStepSequencer

*/



// IMPORTS

import org.puredata.processing.PureData;



// INSTANCES

PureData pd;


// VARIABLES







// SETUP

void setup() {
  
  // Screen
  size(800, 100);
  
  // Pd
  pd = new PureData(this, 44100, 0, 2);
  pd.openPatch("step.pd");
  pd.start();
}




// DRAW
