abstract class Rectangle extends Shape {
  // class vars
  Rectangle ( float x, float y, float w, float h, float el, float er, float tl, float tr, Boolean s, color itsColor)  {
    super( x, y, w, h, el, er, tl, tr,  itsColor);
  }

  //Mehtods
  abstract void draw() ;
  abstract void updateSetup ( float variable1, float variable2, float variable3, float variable4, float variable5, float variable6, float variable7, float variable8, float variable9 )  ;
  
  void rectangle() {
    fill (itsColor);
    rect(x, y, w, h);
    fill(defaultColor);
  }
}
