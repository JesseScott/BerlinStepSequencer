
// OSC

void oscEvent(OscMessage theOscMessage) {
  
  int indexToBang = 0;
  
  // Parse It
  if(theOscMessage.checkAddrPattern("/Bang")) {
    if(theOscMessage.checkTypetag("i")) {
      indexToBang = theOscMessage.get(0).intValue();  
    }  
  } 
  
  // Bang It
  if(indexToBang < NUM_STEPS && indexToBang > 0) {
    tiles[indexToBang].bang(); 
  }
}
