class Ascension {
  int x;
  int y;
  int h;
  int w;
  int menutype = 0;
  long sugarlumpsgain;
  
  Ascension() {
    x = 280;
    y = 655;
    w = width/7;
    h = height/20;
  }
  
  void ascensiondisplay() {
    sugarlumpsgain = totalcookies / 250000;
    if (totalcookies >= 500000 && menutype == 0) {
      fill(#86A397);
      stroke(#86A397);
      rect(0,600,(width/2)-35, 100);
      textSize(25);
      fill(255);
      text("ASCENSION IS AWAITING", 200, 625);
      textSize(15);
      text("For every 250k cookies created, gain 1 sugar lump", 200, 640);
      textSize(20);
      text("Ascend for: " + sugarlumpsgain + " sugar lumps", 140, 680);
      fill(#CBC0AD); 
      stroke(0);
      rect(x,y,w,h);
      fill(0);
      textSize(25);
      text("CONFIRM", x+65, y+(h/2)+10);
    }
    else if (menutype == 1) {
      fill(#86A397);
      stroke(#86A397);
      rect(0,600,(width/2)-35, 100);
      textSize(45);
      fill(255);
      text("Ascending? ", 140, 665);
      fill(#CBC0AD); 
      stroke(0);
      rect(x,y,w,h);
      rect(x,y-h,w,h);
      fill(0);
      textSize(25);
      text("CANCEL", x+65, y+(h/2)+10);
      text("YES", x+60, y+(h/2)-25);
    }
  }
  
  boolean inBoxZone() {
    if (menutype == 0) {
      if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      if (mouseX >= x && mouseX <= x + w && mouseY >= y - h && mouseY <= y + h) {
        return true;
      }
      else {
        return false;
      }
    }
  }//inBoxZone
  
  int returnCancelYes() {
    int zone = -1;
    if (mouseX != x) {//to prevent divide by 0 error
      if (mouseY >= y - h && mouseY <= y) {
        zone = 0;
      }
      else if (mouseY >= y && mouseY <= y+h) {
        zone = 1;
      }
    }
    return zone;
  }//returnCancelYes
  
  void menuSwapper() {
    if (inBoxZone()) {
      if (menutype == 0) {
        menutype = 1;
      }
      else if (returnCancelYes() == 0) {
        ascending = true;
      }
      else if (returnCancelYes() == 1) {
        menutype = 0;
      }
    }
  }//menuSwapper
  
  void performascension() {
    sugarlumps+= sugarlumpsgain;
    cookies = 0;
    totalcookies = 0;
    for (int i = 0; i < upgrade.upgrade.length; i++) {
      for (int j = 0; j < upgrade.upgrade[i].length; j++) {
        if (j != 2) {
          upgrade.upgrade[i][j].upgradecount = 0;
        }
      }
    }
    cpc = 1;
    pcps = 0;
    clicks = 0;
    COOKIETYPE = REGULAR;
    cursorcount = 0;
    cpcboost = 1 + (upgrade.upgrade[2][2].upgradecount * 0.04);
    cpsboost = 1 + (upgrade.upgrade[1][2].upgradecount * 0.03);
    menutype = 0;
    currentshop = 0;
    ascending = false;
    ascensioncount++;
    }
}//Ascension
