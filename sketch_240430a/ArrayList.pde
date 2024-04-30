import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global HUh Variables 
ArrayList <Shape> shapes = new ArrayList <shapes> () ;

PongTable myTable;
Button quit, restart, soloP, duosP, nullP;
ScoreBoard lScore, rScore;
Paddle rPaddle, lPaddle;
Fireworks fireworks;

Baller myBaller;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#898989, blue = #1614D8, pink = #F407F5 ;

void setup() {
  //size(800, 1000);
  fullScreen();
  noStroke();
  println("HELPPPPPPP");
  display();

  if (correctlyOriented == true) {
    myTable = new PongTable(gray, appWidth*0, appHeight*1/10, appWidth, appHeight*8/10);
    //MyButton Program Code located here LOOK LOOK OMG JHONNY???
    quit = new Button("x", 40, red, appWidth*17/20, appHeight*1/30, appWidth/10, appHeight/24);
    restart = new Button("Start New One?", 20, Lgreen, appWidth*1/20, appHeight*1/30, appWidth/10, appHeight/24);
    soloP = new Button("SOLO", 20, myTable.col, appWidth*1/20, appHeight*28/30, appWidth/10, appHeight/24);
    duosP = new Button("DUOS", 20, myTable.col, appWidth*9/20, appHeight*28/30, appWidth/10, appHeight/24);
    nullP = new Button("Saving UP", 20, myTable.col, appWidth*17/20, appHeight*28/30, appWidth/10, appHeight/24);

    //MyScoreBoard Located HERE :DDDDDDDD
    rScore = new ScoreBoard(black, appWidth*6/20, appHeight*1/30, appWidth/10, appHeight/24);
    lScore = new ScoreBoard(black, appWidth*12/20, appHeight*1/30, appWidth/10, appHeight/24);

    
    myBaller = new Baller(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);

    //Paddle Code Initiate LOcated :LLLL
    rPaddle = new Paddle(white, myTable.w*1/30, (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBaller.w*1/2, myTable.h*1/4);
    lPaddle = new Paddle(white, (myTable.w*29/30 - myBaller.w*1/2), (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBaller.w*1/2, myTable.h*1/4);

    myBaller.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    //Supports 
    
    rPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    lPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);


    fireworks = new Fireworks(0, appWidth*-1, appHeight*-1, appHeight*1/30, appWidth*1/30, 0.5);

    myBaller.paused = true;
  }
}

void draw() {
  background(black);
  if (correctlyOriented == false) {
    portrait();
  } else {
   //Pong table Draw
    myTable.draw();
    
    //u see the word button ????
    quit.draw();
    restart.draw();
    soloP.draw();
    duosP.draw();
    nullP.draw();
    //Paddle draw support
    rPaddle.draw();
    lPaddle.draw();



    myBaller.draw();
    fireworks.draw();

    lScore.draw();
    rScore.draw();

    myBaller.paddleUpdate(rPaddle.x, lPaddle.x, rPaddle.y, lPaddle.y, rPaddle.w, lPaddle.w, rPaddle.h, lPaddle.h);



    //goal
    if (myBaller.x < myBaller.w) {
      lScore.inNet = true;
      myBaller.netExplosion(myBaller.x, myBaller.y, 0.5);
    }
    if (myBaller.x > (appWidth - myBaller.w)) {
      rScore.inNet = true;
      myBaller.netExplosion(myBaller.x, myBaller.y, 0.5);
    }
    fireworks.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
  }
}

void mousePressed() {
  if (correctlyOriented == true) {
    if (mouseX > myTable.x && mouseX < (myTable.x + myTable.w) && mouseY > myTable.y && mouseY < (myTable.y + myTable.h)) { //movedBall error catch
      println("Ball Succed To Move");
      myBaller.x = mouseX;
      myBaller.y = mouseY;
    }
    if (mouseX >= quit.x && mouseX <= (quit.x + quit.w) && mouseY >= quit.y && mouseY <= (quit.y + quit.h)) {
      println("Code Succed");
      exit();
    }
    if (mouseX >= restart.x && mouseX <= (restart.x + restart.w) && mouseY >= restart.y && mouseY <= (restart.y + restart.h)) {
      println("newly initiated");
      myBaller.paused = true;
      lScore.scoreReset();
      rScore.scoreReset();
    }
  }
}


void keyPressed() {
  if (correctlyOriented == true) {
    rPaddle.keyPressedWASD();
    lPaddle.keyPressedARROW();
    myBaller.endPause();
  }

  if (key == ESC) {
    println("RAHHHHHHHH");
  }
}

void keyReleased() {
  if (correctlyOriented == true) {
    rPaddle.keyReleasedWASD();
    lPaddle.keyReleasedARROW();
  }
}

void keyPressed () {
}
