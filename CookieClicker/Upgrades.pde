class Upgrades {
  UpgradeBox[][] upgrade;
  int basex = 450;
  int basey = 120;
  int boxwidth = 420;
  int boxheight = 70;
  
  Upgrades(int numupgrades, int numtabs) {
    upgrade = new UpgradeBox[numupgrades][numtabs];
    setupBox();
  }//constructor
  
  void setupBox() {
    for (int i = 0; i < upgrade.length; i++) { 
      for (int j = 0; j < upgrade[i].length; j++) {
        upgrade[i][j] = new UpgradeBox(basex, basey+(boxheight*i), boxwidth, boxheight, 0, i, j);
      }
    }
  }//setupBox
  
  void showBox() {
    for (int i = 0; i < upgrade.length; i++) {
      for (int j = 0; j < upgrade[i].length; j++) { 
          if (j == currentshop) {
          upgrade[i][j].displayBox();
          determineCost(upgrade[i][j]);
          }
      }
    }
  }//showBox
  
  void determineCost(UpgradeBox upgrade) {
    float price = 0;
    if (upgrade.shoptype == 0) { //for shop 1
      if (upgrade.type == 0 && cursorcount != maxcursorcount) {
        price = pow(25, upgrade.upgradecount + 1); 
      }
      else if (upgrade.type == 1) {
        price = 40 * (pow(1.15, upgrade.upgradecount));
      }
      else if (upgrade.type == 2) {
        price = 1000 * (pow(1.15, upgrade.upgradecount));
      }
      else if (upgrade.type == 3) {
        price = 12000 * (pow(1.15, upgrade.upgradecount));
      }
      else if (upgrade.type == 4) {
        price = 130000 * (pow(1.15, upgrade.upgradecount));
      }
      else if (upgrade.type == 5) {
        price = 1000800 * (pow(1.15, upgrade.upgradecount));
      }
      else if (upgrade.type == 6) {
        price = 15000000 * (pow(1.15, upgrade.upgradecount));
      }
      else if (upgrade.type == 7) {
        price = 220000000 * (pow(1.15, upgrade.upgradecount));
      }
    }
    else if (upgrade.shoptype == 1) { //for shop 2
      if (upgrade.type == 0) {
        price = 100 * (pow(2.2, upgrade.upgradecount)); 
      }
      else if (upgrade.type == 1 && upgrade.upgradecount < 1) {
        price = 500;
      }
      else if (upgrade.type == 2 && upgrade.upgradecount < 1) {
        price = 4200;
      }
      else if (upgrade.type == 3 && upgrade.upgradecount < 1) {
        price = 55000;
      }
      else if (upgrade.type == 4 && upgrade.upgradecount < 1) {
        price = 540000;
      }
      else if (upgrade.type == 5 && upgrade.upgradecount < 1) {
        price = 6600000;
      }
      else if (upgrade.type == 6 && upgrade.upgradecount < 1) {
        price = 710000000;
      }
      else if (upgrade.type == 7 && upgrade.upgradecount < 1) {
        price = 2200000000L;
      }
    }
    else if (upgrade.shoptype == 2) { //for shop 3
      if (upgrade.type == 0 && upgrade.upgradecount < 1) {
        price = 1000; 
      }
      else if (upgrade.type == 1) {
        price = 1 * (pow(1.2, upgrade.upgradecount));
      }
      else if (upgrade.type == 2) {
        price = 2 * (pow(1.2, upgrade.upgradecount));
      }
      else if (upgrade.type == 3 && upgrade.upgradecount < 1) {
        price = 1700;
      }
      else if (upgrade.type == 4 && upgrade.upgradecount < 1) {
        price = 500;
      }
      else if (upgrade.type == 5 && upgrade.upgradecount < 1) {
        price = 750;
      }
      else if (upgrade.type == 6 && upgrade.upgradecount < 1) {
        price = 150;
      }
      else if (upgrade.type == 7 && upgrade.upgradecount < 1) {
        price = 1000000;
      }
    }
    else if (upgrade.shoptype == 3) {//for shop 4
      if (upgrade.type == 0 && upgrade.upgradecount < 1) {
        price = 100; 
      }
      else if (upgrade.type == 1 && upgrade.upgradecount < 1) {
        price = 200;
      }
      else if (upgrade.type == 2 && upgrade.upgradecount < 1) {
        price = 300;
      }
      else if (upgrade.type == 3 && upgrade.upgradecount < 1) {
        price = 500;
      }
      else if (upgrade.type == 4 && upgrade.upgradecount < 1) {
        price = 1000;
      }
      else if (upgrade.type == 5 && upgrade.upgradecount < 1) {
        price = 2500;
      }
      else if (upgrade.type == 6 && upgrade.upgradecount < 1) {
        price = 5000;
      }
      else if (upgrade.type == 7 && upgrade.upgradecount < 1) {
        price = 7700;
      }
    }
      if (discount == true && currentshop != 2) {
        upgrade.cost = (long) (price * 0.8);
      }
      else {
        upgrade.cost = (long) price;
      }
  }//determineCost
  
  boolean inUpgradeZone() {
    if (mouseX >= basex && mouseX <= basex + (boxwidth * numupgrades) && mouseY >= basey && mouseY <= basey + (boxheight * numupgrades)) {
      return true;
    }
    else {
      return false;
    }
  }//inUpgradeZone
  
  int returnUpgradeZone() {
    int upgradeZone;
    if (mouseY != basey) {//to prevent divide by 0 error
      upgradeZone = (mouseY - basey) / boxheight;
    }
    else {
      return 0;
    }
    return upgradeZone;
  }//returnUpgradeZone
  
  void upgradeItem() {
    if (inUpgradeZone()) { //check to see if cursor is within the boundaries of an upgrade box
      if (currentshop == 0 && upgrade[returnUpgradeZone()][currentshop].cost <= cookies) { //if player can afford upgrade, and in specific menu, upgrade!
        if (returnUpgradeZone() == 0 && cursorcount != maxcursorcount) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          cursorcount++;
        }
        else if (returnUpgradeZone() == 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 2;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 2) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 10;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 3) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 55;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 4) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 310;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 5) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 2200;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 6) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 11000;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 7) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          pcps += 67000;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }

      }
      else if (currentshop == 1 && upgrade[returnUpgradeZone()][currentshop].cost <= cookies) {
        if (returnUpgradeZone() == 0) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpcboost+= 0.9;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 1 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.5;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 2 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.6;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 3 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.7;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 4 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.8;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 5 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.8;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 6 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.85;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 7 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookies = cookies - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.9;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
      }
      else if (currentshop == 2 && upgrade[returnUpgradeZone()][currentshop].cost <= sugarlumps) {
        if (returnUpgradeZone() == 0 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 5;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          cpsboost+= 0.03;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 2) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          cpcboost+= 0.04;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 3 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          discount = true;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 4 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          goldencookie = true;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 5 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          symbiosis = true;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 6 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          cmboost = true;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
        else if (returnUpgradeZone() == 7 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          sugarlumps = sugarlumps - upgrade[returnUpgradeZone()][currentshop].cost;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
        }
      }
      else if (currentshop == 3 && upgrade[returnUpgradeZone()][currentshop].cost <= clicks) {
        if (returnUpgradeZone() == 0 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1) {
          cookieboost = 1.05;
          COOKIETYPE = WALNUT;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 1 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.1;
          COOKIETYPE = OATMEAL;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 2 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.15;
          COOKIETYPE = GINGER;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 3 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.2;
          COOKIETYPE = SILVER;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 4 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.3;
          COOKIETYPE = SKETCH;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 5 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.4;
          COOKIETYPE = BURNT;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 6 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.5;
          COOKIETYPE = BLACKHOLE;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
        else if (returnUpgradeZone() == 7 && upgrade[returnUpgradeZone()][currentshop].upgradecount < 1 && upgrade[returnUpgradeZone()-1][currentshop].upgradecount == 1) {
          cookieboost = 1.75;
          COOKIETYPE = REVERSE;
          upgrade[returnUpgradeZone()][currentshop].upgradecount++;
          upgrade[returnUpgradeZone()][currentshop].cost = 0;
        }
      }
    }
  }//upgradeItem 
  
}//Upgrades
