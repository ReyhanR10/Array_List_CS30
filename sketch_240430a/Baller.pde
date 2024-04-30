class Baller extends Circle {
  //class vars
  PFont font = createFont ("Kailasa", 55);
  float startX, startY, xSpeed, ySpeed, xSpeedChange, ySpeedChange;
  float tablex, tabley, tablew, tableh;
  float paddlex, paddley, paddlew, paddleh;
  Boolean rightSide = false;
  Boolean paused = false;
  Boolean scoreCondition = false;

  Baller (color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    startX = x;
    startY = y;
    xSpeed = 3*xSpeedChange();
    ySpeed = 3*ySpeedChange();
    xSpeedChange = 1.2; //break bounce physics - change speed
    ySpeedChange = 1.2;
  }

  //methods
  float xSpeedChange() {
    float xSpeedChange = int (random(-2, 2));
    while (xSpeedChange == 0) {
      xSpeedChange = int (random(-2, 2)); //variable must be populated FIRST!
    }
    return xSpeedChange;
  }

  float ySpeedChange() {
    float ySpeedChange = int (random(-2, 2)); //THIS IS THE CODE FOR CHANGING THE SPEED!!!!!!!!!!!11111!!!!!!1!11!!
    while (ySpeedChange == 0) {
      ySpeedChange = int (random(-2, 2));
    }
    return ySpeedChange;
  }

  void draw() {
    ball();

    pause();
    move();
  }

  void move() {
    bounce();
    x += xSpeed * xSpeedChange;
    y += ySpeed * ySpeedChange;

    if (x < (tablew*1/2)) {
      rightSide = true;
    } else {
      rightSide = false;
    }
  }

  void bounce() {
    if (this.rightSide == true) {
      if (this.x < (paddlex + paddlew + (w/2)) && this.y > paddley && this.y < (paddley + paddleh)) {
        if (this.x > paddlex - w) {
          this.x = (paddlex + paddlew + (w/2));
          this.xSpeed *= -1;
        } else {
          this.xSpeed *= -1;
        }
      }
    } else {
      if (this.x > (paddlex - (w/2)) && this.y > paddley && this.y < (paddley + paddleh)) {
        if (this.x < paddlex + w) {
          this.x = (paddlex - (w/2));
          this.xSpeed *= -1;
        } else {
          this.xSpeed *= -1;
        }
      }
    }
    if (this.y < tabley + (w/2) || this.y > (tabley + tableh - (w/2))) {
      this.ySpeed *= -1;
    }
    if (this.x < tablex + (w/2) || this.x > tablew - (w/2)) {
      this.xSpeed *=  -1;
    }
  }
  //Pause Button Code RUNNING WELL LOL
  void pause() {
    if (paused == true) {
      this.x = startX ;
      this.y = startY ;
      fill(blue );
      rect(0, 0, appWidth, appHeight);
      fill(defaultColor);
      if (scoreCondition == true) {
        fill(pink);
        createText("OKAY U COOKING SOMETHING JUST PRESS SPACE PLEASE", 0, 0, appWidth, appHeight);
        fill(defaultColor);
      } else {
        fill(pink );
        createText("LOL? THERES NO PONG FOR U BUD!", 0, 0, appWidth, appHeight);
        fill(defaultColor);
      }
    }
  }

  void tableUpdate(float tablexParameter, float tableyParameter, float tablewParameter, float tablehParameter) {
    tablex = tablexParameter;
    tabley = tableyParameter;
    tablew = tablewParameter;
    tableh = tablehParameter;
  }

  void paddleUpdate(float rpaddlexParameter, float lpaddlexParameter, float rpaddleyParameter, float lpaddleyParameter, float rpaddlewParameter, float lpaddlewParameter, float rpaddlehParameter, float lpaddlehParameter) {
    if (rightSide == true) {
      paddlex = rpaddlexParameter;
      paddley = rpaddleyParameter;
      paddlew = rpaddlewParameter;
      paddleh = rpaddlehParameter;
    } else {
      paddlex = lpaddlexParameter;
      paddley = lpaddleyParameter;
      paddlew = lpaddlewParameter;
      paddleh = lpaddlehParameter;
    }
  }

  void netExplosion(float xParameter, float yParameter, float gravityParameter) {
    fireworks = new Fireworks(0, xParameter, yParameter, 0, 0, gravityParameter);

    paused = true;
    scoreCondition = true;
    this.x = startX ;
    this.y = startY ;
    this.xSpeed *= xSpeedChange();
    this.ySpeed *= ySpeedChange();
  }

  void endPause() {
    if (paused == true && key == ' ') {
      paused = false;
      scoreCondition = false;
      fireworks.pauseUpdate();
    }
  }
  void createText (String text, float x, float y, float w, float h) {
    fill(pink);
    textAlign (CENTER, CENTER);
    textFont(font, 40);
    text(text, x, y, w, h);
    fill(defaultColor);
  }
}

//RESP:::
//NETEXPLOSION
