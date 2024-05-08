abstract class Circle extends Shape {
  // class vars
  Circle( float x, float y, float w, float h, color itsColor) {
    super( x, y, w, h, itsColor );
  }

  //methods
  abstract void draw();
  
  void updateSetup ( float Variable1, float Variable2, float Variable3,  float Variable4  ) {
  }

  void ball() {
    fill (col);
    ellipse(x, y, w, h);
    fill(defaultColor);
  }

  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/
}
