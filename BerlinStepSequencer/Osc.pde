
// OSC

void oscEvent(OscMessage theOscMessage) {
  
  int indexToBang = -1;
  
  // Parse It
  if(theOscMessage.checkAddrPattern("/Bang")) {
    if(theOscMessage.checkTypetag("i")) {
      indexToBang = theOscMessage.get(0).intValue() -1;  
    }  
  } 
  
  // Bang It
  if(indexToBang < NUM_STEPS && indexToBang > 0) {
    tiles[indexToBang].bang(); 
  }
  
}
