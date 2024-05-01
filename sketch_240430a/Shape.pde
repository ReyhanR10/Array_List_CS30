abstract class Shape {
  //class vars
  float x, y, w, h ;
  color col, defaultColor, grey = #D8D2D2, blue = #22A7ED ;

  Shape ( float x, float y, float w, float h, color collector ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = collector ;
    defaultColor = grey ; //nightModeColor ();
  }



  //methods
  abstract void draw();


  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/
}
