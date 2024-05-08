int appW, appH ;
Boolean checkDisplay = false ;
//
PFont general ;

//
void checkDisplay () {
  checkDisplay = ( appW >= appH ) ? false : true ;
  if ( checkDisplay == true ) {
    checkDisplayProb = true ;
  } else {
    checkDisplayProb = flse ;
  }
} //End CheckDisplayProblem Solved
void display () {
  appW = width ;
  appH = height ;
  checkDisplay () ;
  textSetupRun () ; //See Down there, there's something ;
  if ( checkDisplay == true ) song1.loop ( 0 ) ; // loop audio run
} //
//
void Landscape () {
}
void textSetup () {
} //End textSetup
//
void preDrawText (float height, color ink, int alignHorizontal, int alignVertical, PFont font) {
  fill ( ink ) ;
  textAlign ( textCalculate( height, string, rectW ) ) ;
  text ( string, rectX, rectY, rectW, rectH ) ;
  textReset () ;
}
void textReset () {
  fill ( 0 ) ; //Reset TExt 
  
}//
//
float textCalculate( float size, String string, float rectW ) {

textSize ( size ) ; //textW, size 
while ( textWidth(string) > rectW ) 
{
  size = size  * 0.99 ; //Size 
  textSize ( size ) ;
} // END 

}
