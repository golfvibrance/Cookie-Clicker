class Cookie {
  
  int x;
  int y;
  int csize;
  int chipsize;
  
  Cookie() {
    x = 200;
    y = 350;
    csize = 300;
    chipsize = 35;
  }//Cookie default constructor
      
  void display(int CookieType) {
    strokeWeight(15);
    if (goldencookie != true) { //for cookie
      if (CookieType == REGULAR) {
        fill(#BD8C61);
      }  
      else if (CookieType == WALNUT) {
        fill(#D1B19B);
      }
      else if (CookieType == OATMEAL) {
        fill(#B59B7C);
      }
      else if (CookieType == GINGER) {
        fill(#b06500);
      }
      else if (CookieType == SILVER) {
        fill(#c0c0c0);
      }
      else if (CookieType == SKETCH) {
        fill(255);
      }
      else if (CookieType == BURNT) {
        fill(0);
      }
      else if (CookieType == BLACKHOLE) {
        fill(0);
      }
      else if (CookieType == REVERSE) {
        fill(#270D0B);
      }
    }
    else {
      fill(#FFD700);
    }
    circle(x,y+50,csize);
    
    if (CookieType == REGULAR) { //for chips
      fill(#270D0B);
    }
    else if (CookieType == WALNUT) {
      fill(#F1E6DE);
    }
    else if (CookieType == OATMEAL) {
      fill(#272838);
    }
    else if (CookieType == GINGER) {
      fill(#8A4F00);
    }
    else if (CookieType == SILVER) {
      fill(#c0c0c0);
    }
    else if (CookieType == SKETCH) {
      fill(255);
    }
    else if (CookieType == BURNT) {
      fill(#8a3324);
    }
    else if (CookieType == BLACKHOLE) {
      fill(0);
      stroke(255);
    }
    else if (CookieType == REVERSE) {
      fill(#BD8C61);
    }
    circle(x-(x/4),y-(y/4)+50,chipsize*1.4);
    circle(x+(x/5),y-(y/4)+50,chipsize*1.2);
    circle(x-(x/5),y+(y/3.5)+50,chipsize*0.8);
    circle(x+(x/2),y+50,chipsize/2);
    circle(x,y+(y/20)+50,2.5*chipsize);
    circle(x-(x/2),y+(y/10)+50,chipsize*1.5);
    circle(x+(x/3),y+(y/4.2)+50,chipsize*0.8);
    stroke(0);
  }//display
  
  void shrink() {
    csize = (csize*5)/6;
    chipsize = (chipsize*5)/6;
    x = (x*5)/6;
  }//shrink
  
  void grow() {
    csize = (csize*6)/5;
    chipsize = (chipsize*6)/5;
    x = (x*6)/5;
  }//grow
  
  boolean cookiecheck() {
    return dist(mouseX, mouseY, x, y) <= csize/2;
  }//cookiecheck
  
}//Cookie
