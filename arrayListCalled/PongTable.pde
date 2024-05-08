class PongTable extends Rectangle {
  //class vars

  PongTable (float x, float y, float w, float h, float el, float er, float tl, float tr, Boolean s, color itsColor)  {
    super( x, y, w, h, el, er, tl, tr, itsColor);
    //add gravity - dictates firework move physics.
  }

  //methods
 void updateSetup( float netWidth, float variable2, float variable3, float variable4, float variable5, float variable6, float variable7, float variable8, float variable9 ) {
    
    
  } //End updateSetup void 
  //
  
  
  void draw() {
    rectangle();
  }
  
}

//RESP:::
//GIVES BAlL BOUNCE
//GIVES PADDLE EDGE OF NET 
