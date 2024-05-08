class Paddle extends Rectangle {
  //class vars
  Boolean up, down;
  float paddleSpeedDirection;
  float tablex, tabley, tablew, tableh;
  float xEdgeBounce = 0.0 ;

  Paddle( float x, float y, float w, float h, float el, float er, float tl, float tr, Boolean s, color itsColor) {
    super( x, y, w, h, el, er, tl, tr, itsColor);
    paddleSpeedDirection = 9;
    this.up = false;
    this.down = false;
    //add gravity - dictates firework move physics.
  }
  void updateSetup ( float pongTableMiddle, float variable2, float variable3, float variable4 ) {
    if ( x > pongTableMiddle ) ;
    if ( pongTableMiddle > x ) {
      xEdgeBounce += w ;
    } else { 
      x -= w ;
      xEdgeBounce -= w ;
    }
  }
  //methods
  void draw() {
    rectangle();


    if (up == true) {
      movePaddleUp();
    }
    if (down == true) {
      movePaddleDown();
    }
  }

  void movePaddleUp() {
    y -= paddleSpeedDirection;
    if (y < tabley) { //error catch
      y = tabley;
    }
  }

  void movePaddleDown() {
    y += paddleSpeedDirection;
    if ((y + h) > (tabley + tableh)) {
      y = ((tabley + tableh) - h);
    }
  }

  void tableUpdate(float tablexParameter, float tableyParameter, float tablewParameter, float tablehParameter) {
    tablex = tablexParameter;
    tabley = tableyParameter;
    tablew = tablewParameter;
    tableh = tablehParameter;
  }

  void keyPressedWASD() {
    if (key == 'w' || key == 'W') {
      down = false;
      up = true;
    }
    if ( key == 's' || key == 'S') {
      up = false;
      down = true;
    }
  }

  void keyPressedARROW() {
    if (key == CODED && keyCode == UP) {
      down = false;
      up = true;
    }
    if (key == CODED && keyCode == DOWN) {
      up = false;
      down = true;
    }
  }

  void keyReleasedWASD() {
    if (key == 'w' || key == 'W') {
      up = false;
    }
    if (key == 's' || key == 'S') {
      down = false;
    }
  }

  void keyReleasedARROW() {
    if (key == CODED && keyCode == UP) {
      up = false;
    }
    if (key == CODED && keyCode == DOWN) {
      down = false;
    }
  }
}

//RESP:::
//GIVE X, Y, W, H to BALL
//
