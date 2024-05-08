abstract class Shape {
  //class vars
  float x, y, w, h, el, er, tl, tr ;
  color itsColor, defaultColor, grey = #D8D2D2, blue = #22A7ED ;
  Boolean bruh ;
  Boolean bro ;

  Shape (  float x, float y, float w, float h, float el, float er, float tl, float tr, Boolean s, color itsColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.el = el;
    this.er = er ;
    this.tl = tl;
    this.tr = tr ;
    this.itsColor = itsColor ;
    defaultColor = grey ; //nightModeColor ();
  }



  //methods
  abstract void draw();
  abstract void updateSetup( float variable1, float variable2, float variable3, float variable4, float variable5, float variable6, float variable7, float variable8, float variable9 );
  // variable2, float  variable3, float variable4) ; ;
   
  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/
}
