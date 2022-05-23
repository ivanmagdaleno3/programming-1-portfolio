//caculator 2021 oct ivan magdaleno

Button[] numButtons = new Button [10];
Button[] opButtons = new Button [13];
String dVal = "0";//used to update display
String op = "";// used to set tje operatos value
boolean left = true;// used to diside left or right of the operator
float r = 0.0;
float l = 0.0;
float result = 0.0;

void setup () {
  size(240, 350);
  numButtons[0] = new Button(0, 250, 60, 50, "1");
  numButtons[1] = new Button(0, 200, 60, 50, "4");
  numButtons[2] = new Button(0, 150, 60, 50, "7");
  numButtons[3] = new Button(0, 100, 60, 50, "0");
  numButtons[4] = new Button(60, 250, 60, 50, "2");
  numButtons[5] = new Button(60, 200, 60, 50, "5");
  numButtons[6] = new Button(60, 150, 60, 50, "8");
  numButtons[7] = new Button(120, 250, 60, 50, "3");
  numButtons[8] = new Button(120, 200, 60, 50, "6");
  numButtons[9] = new Button(120, 150, 60, 50, "9");
  opButtons[0] = new Button(180, 100, 60, 50, "*");
  opButtons[1] = new Button(180, 50, 60, 50, "÷");
  opButtons[2] = new Button(0, 300, 60, 50, "C");
  opButtons[3] = new Button(0, 50, 120, 50, "±");
  opButtons[4] = new Button(60, 300, 60, 50, ".");
  opButtons[5] = new Button(60, 100, 60, 50, "sin");
  opButtons[6] = new Button(60, 50, 60, 0, "");
  opButtons[7] = new Button(120, 300, 60, 50, "²");
  opButtons[8] = new Button(120, 100, 60, 50, "√");
  opButtons[9] = new Button(120, 50, 60, 50, "◍");
  opButtons[10] = new Button(180, 250, 60, 100, "=");
  opButtons[11] = new Button(180, 200, 60, 50, "+");
  opButtons[12] = new Button(180, 150, 60, 50, "-");
}
void draw () {
  background(128);
  updateDisplay();
  for (int i =0; i <numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i =0; i <opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}
void mousePressed() {
  for (int i=0; i<numButtons. length; i ++) {
    if (numButtons[i].on && dVal.length() <29) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i =0; i<opButtons.length; i++) {
    if (opButtons[i].on) {
      handleEvent(opButtons[i].val, false);
    }
  }
  println("L:" + l + " Op:"+ op + " R:" + r + " result:" + result + " Left:" + left);
}


void updateDisplay() {
  fill(128);
  rect(0, 0, 250, 50);
  fill (0);
  if (dVal.length()<15) {
    textSize(30);
  } else if (dVal.length()<18) {
    textSize(25);
  } else if (dVal.length()<21) {
    textSize(20);
  } else if (dVal.length()<25) {
    textSize(18);
  } else if (dVal.length()<27) {
    textSize(16);
  } else {
    textSize(15);
  }
  textAlign(LEFT);

  text(dVal, width-220, 30);
}
void performCalc() {
  if (op.equals("+")) {
    result = l+r;
    // do somehting
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("/")) {
    result = l/r;
  } else if (op.equals("*")) {
    result = l*r;
  }
  dVal = str(result);
  l = result;
  left = true;
}

void handleEvent(String val, boolean num) {
  if (num) {
    // handle al logic ralating to number
    if (dVal.length()<29  && dVal.equals("0")) {
      dVal = val;
      if (left == true) {
        l = float(dVal);
      } else if (!left ) {
        r = float(dVal);
      }
      l = float (dVal);
    } else if ( dVal.length()<29) {
      dVal = dVal + val;
      if (left == true) {
        l = float(dVal);
      } else if (!left ) {
        r = float(dVal);
      }
    }
  } else if (val.equals("C")) {
    dVal = "0";
    op = "";
    left = true;
    r = 0.0;
    l = 0.0;
    result = 0.0;
  } else if (val.equals("+")) {
    dVal = "0";
    op = "+";
    left = false;
  } else if (val.equals("÷")) {
    dVal = "0";
    op = "/";
    left = false;
     } else if (val.equals("*")) {
      dVal = "0";
      op = "*";
      left = false;
      } else if (val.equals("-")) {
      dVal = "0";
      op = "-";
      left = false;
  } else if (val.equals("=")) {
    performCalc();
  } else if (val.equals(".")) {
    if (!dVal.contains(".") || dVal.contains(".0")) {
      dVal = dVal + ".";
    
    } else if (val.equals("-")) {
      dVal = "0";
      op = "-";
      left = false;
    }
  } else if (val.equals("±")) {
    if (left) {
      l *=-1;
      dVal= str(l);
    } else if (!left) {
      r*=1;
      dVal = str(r);
    }
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(radians(l)) ;
      dVal= str(l);
    } else if (!left) {
      r = sin(radians(l)) ;
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal= str(l);
    } else if (!left) {
      r =  sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("²")) {
    if (left) {
      l = float(dVal);
      dVal= str(l);
    } else if (!left) {
      r =  sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("◍")) {
    if (left) {
      l = round(l);
      dVal= str(l);
    } else if (!left) {
      r =  round(r);
      dVal = str(r);
    }
  }
}

void keyPressed () {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyPressed) {
    if (keyCode == 49 || keyCode == 97 ) {
      //hendle the event for 1
      handleEvent("1", true);
    } else if (keyCode == 50 || keyCode == 98) {
      handleEvent("2", true);
    } else if (keyCode == 51 || keyCode == 99) {
      handleEvent("3", true);
    } else if (keyCode == 52 || keyCode == 100) {
      handleEvent("4", true);
    } else if (keyCode == 53 || keyCode == 101) {
      handleEvent("5", true);
    } else if (keyCode == 54 || keyCode == 102) {
      handleEvent("6", true);
    } else if (keyCode == 55 || keyCode == 103) {
      handleEvent("7", true);
    } else if (keyCode == 56 || keyCode == 104) {
      handleEvent("8", true);
    } else if (keyCode == 57 || keyCode == 105) {
      handleEvent("9", true);
    } else if (keyCode == 48 || keyCode == 96) {
      handleEvent("0", true);
    } else if (keyCode == 10 ) {
      handleEvent("=", false);
    } else if (keyCode == 106 ) {
      handleEvent("*", false);
    } else if (keyCode == 111 ) {
      handleEvent("÷", false);
    }else if (keyCode == 109 ) {
      handleEvent("-", false);
    }else if (keyCode == 107 ) {
      handleEvent("+", false);
  }
  }
}
