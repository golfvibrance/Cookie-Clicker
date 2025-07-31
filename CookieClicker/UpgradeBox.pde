class UpgradeBox {
  
  int x;
  int y;
  int w;
  int h;
  int upgradecount;
  int type;
  long cost;
  int shoptype;
  

  UpgradeBox(int _x, int _y, int _w, int _h, int uc, int ty, int stype) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    upgradecount = uc;
    type = ty;
    shoptype = stype;
  }//constructor
  
  void displayBox() {
    if (shoptype == 0) {
      strokeWeight(5);
      fill(#E5BE9E);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      textAlign(LEFT);
      if (type == 0) {
        text("Cursors", x+10, y+30);
        textSize(15);
        text(cursorcount + " out of " + maxcursorcount + "     +2 clicks per second", x+10, y+50);
      }
      else if (type == 1) {
        text("Rolling Pins", x+10, y+30);
        textSize(15);
        text("grants 2PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 2) {
        text("Grandmas", x+10, y+30);
        textSize(15);
        text("grants 10PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 3) {
        text("Master Ovens", x+10, y+30);
        textSize(15);
        text("grants 55PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 4) {
        text("Cookie Plows", x+10, y+30);
        textSize(15);
        text("grants 310PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 5) {
        text("Factories", x+10, y+30);
        textSize(15);
        text("grants 2150PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 6) {
        text("Cookie Wizards", x+10, y+30);
        textSize(15);
        text("grants 11000PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 7) {
        text("Time Machines", x+10, y+30);
        textSize(15);
        text("grants 67000PCPS", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
        textAlign(RIGHT);
        textSize(15);
        if (cost != 0) {
          text(cost + " cookies", x+410, y+30);
        }
    }
    else if (shoptype == 1) {
      strokeWeight(5);
      fill(#E5BE9E);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      textAlign(LEFT);
      if (type == 0) {
        text("Gloves", x+10, y+30);
        textSize(15);
        text("Boosts CPC by 90% per upgrade", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 1) {
        text("Stronger Wood", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 50%", x+10, y+50);
      }
      else if (type == 2) {
        text("Made with Love", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 60%", x+10, y+50);
      }
      else if (type == 3) {
        text("Deluxe Parts", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 70%", x+10, y+50);
      }
      else if (type == 4) {
        text("Turbo Farms", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 80%", x+10, y+50);
      }
      else if (type == 5) {
        text("Cookie Capitalism", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 80%", x+10, y+50);
      }
      else if (type == 6) {
        text("Archmage Mana", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 85%", x+10, y+50);
      }
      else if (type == 7) {
        text("Cookie Paradox", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 90%", x+10, y+50);
      }
        textAlign(RIGHT);
        textSize(15);
        if (cost != 0) {
          text(cost + " cookies", x+410, y+30);
        }
      }
    else if (shoptype == 2) {
      strokeWeight(5);
      fill(#E5BE9E);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      textAlign(LEFT); 
      if (type == 0) {
        text("Cookie Delimiter", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 500%", x+10, y+50);
      }
      else if (type == 1) {
        text("Angel Crumble", x+10, y+30);
        textSize(15);
        text("Boosts PCPS by 3% per level", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 2) {
        text("Heavenly Boost", x+10, y+30);
        textSize(15);
        text("Boosts CPC by 4% per level", x+10, y+50);
        textSize(25);
        text(upgradecount, x+380, y+55);
      }
      else if (type == 3) {
        text("Freshly Baked", x+10, y+30);
        textSize(15);
        text("A 15% discount on most shops. Clicks too!", x+10, y+50);
      }
      else if (type == 4) {
        text("Golden Aura", x+10, y+30);
        textSize(15);
        text("A golden cookie! +10 clicks per second", x+10, y+50);
      }
      else if (type == 5) {
        text("Symbiosis", x+10, y+30);
        textSize(15);
        text("Adds 35% of your base PCPS to your CPC.", x+10, y+50);
      }
      else if (type == 6) {
        text("Click Master", x+10, y+30);
        textSize(15);
        text("For every 50 clicks, gain 1% to your base CPC.", x+10, y+50);
      }
      else if (type == 7) {
        text("Bragging Rights", x+10, y+30);
        textSize(15);
        text("Why would you ever buy this? Does nothing.", x+10, y+50);
      }
        textAlign(RIGHT);
        textSize(15);
        if (cost != 0) {
          text(cost + " sugar lumps", x+410, y+30);
        }
    }
    else if (shoptype == 3) {
      strokeWeight(5);
      fill(#E5BE9E);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      textAlign(LEFT); 
      if (type == 0) {
        text("Walnut Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.05x.", x+10, y+50);
      }
      else if (type == 1) {
        text("Oatmeal Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.1x.", x+10, y+50);
      }
      else if (type == 2) {
        text("Ginger Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.15x.", x+10, y+50);
      }
      else if (type == 3) {
        text("Silver Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.2x.", x+10, y+50);
      }
      else if (type == 4) {
        text("Sketch Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.3x.", x+10, y+50);
      }
      else if (type == 5) {
        text("Burnt Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.4x.", x+10, y+50);
      }
      else if (type == 6) {
        text("Black Hole Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.5x.", x+10, y+50);
      }
      else if (type == 7) {
        text("Reverse Cookie", x+10, y+30);
        textSize(15);
        text("Multiplies PCPS and CPC by 1.75x.", x+10, y+50);
      }
        textAlign(RIGHT);
        textSize(15);
        if (cost != 0) {
          text(cost + " clicks", x+410, y+30);
        }
      }
      if (cost == 0) {
          text("BOUGHT", x+410, y+30);
        }
  }//displayBox

}//UpgradeBox
