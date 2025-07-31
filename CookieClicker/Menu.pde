class Menu {
  Menu() {
  }
  
  void displayMenu() {
    strokeWeight(3);
    fill(#361D2E);
    stroke(#361D2E);
    rect(width/2.15,0,width,height);
    rect(0,0,width,height/7);
    fill(#86A397);
    stroke(#86A397);
    rect(0,height/7,(width/2)-35, 130);
    textSize(15);
    fill(255);
    textAlign(LEFT);
    text("STATS", 10, height/5 - 20);
    text("RANK: " + (totalcookies >= 500000000 ? "Cookie God" : (totalcookies >= 100000000 ? "Cookie Conqueror" : (totalcookies >= 25000000 ? "Cookie King" : (totalcookies >= 5000000 ? "Cookie Master" : (totalcookies >= 1000000 ? "Cookie Tycoon" : (totalcookies >= 500000 ? "Cookie Pro" : (totalcookies >= 100000 ? "Cookie Expert" : (totalcookies >= 25000 ? "Cookie Chef" : (totalcookies >= 5000 ? "Cookie Novice" : (totalcookies >= 1000 ? "Cookie Beginner" : "Cookie Noob")))))))))), 200, height/5 - 20);
    text("Cookies: " + cookies, 10, height/5);
    text("Cookies per click (CPC): " + (long) int((cmboost ? cmformula : 1) * ((cpc * cookieboost * pow(2,cpcboost-1)) + (symbiosis ? symformula : 0))), 10, (height/5)+20);
    text("Passive cookies per second (PCPS): " + (long) int((pcps * cookieboost * (pow(2,cpsboost-1)))), 10, (height/5)+40); 
    text("Total Clicks: " + clicks, 10, (height/5)+60);
    text("Total Cookies: " + totalcookies, 180, (height/5)+60);
    if (ascensioncount > 0) {
      text("Sugar Lumps: " + sugarlumps, 10, (height/5)+80);
    }
    textSize(35);
    text("Shops", 500, 37);
    textSize(30);
    text("Cookie Clicker Abridged", 40, height/10);
    textSize(30);
    text("Current Shop", 680, 50);
    textSize(20);
    if (currentshop == 0) {
      text("Basic Upgrades", 700, 80);
    }
    else if (currentshop == 1) {
      text("Advanced Upgrades", 690, 80);
    }
    else if (currentshop == 2) {
      if (ascensioncount == 0) {
        textSize(10);
        text("Ascension is unlocked at 500k cookies", 680, 105);
      }
      textSize(20);
      text("Ascension Upgrades", 685, 80);
    }
    else if (currentshop == 3) {
      text("Cookie Types", 710, 80);
      textSize(10);
      text("Cookies must be bought in order", 700, 105);
    }
  }    
}//Menu
