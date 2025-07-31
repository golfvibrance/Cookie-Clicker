class Shops { 
  ShopTab[] shop;
  int basex = 450;
  int basey = 47;
  int tabsize = 50;
  
  Shops(int numtabs) {
    shop = new ShopTab[numtabs];
    setupTab();
  }//default constructor
  
  void setupTab() {
    for (int i = 0; i < shop.length; i++) { 
      shop[i] = new ShopTab(basex+(tabsize*i), basey, tabsize, i);
    }
  }
    
  void showTab() {
    for (int i = 0; i < shop.length; i++) {
      shop[i].displayTab();
    }
  }
  
  boolean inShopZone() {
    if (mouseX >= basex && mouseX <= basex + (tabsize * numtabs) && mouseY >= basey && mouseY <= basey + tabsize) {
      return true;
    }
    else {
      return false;
    }
  }//inShopZone
  
  int returnShopZone() {
    int shopZone;
    if (mouseX != basex) {//to prevent divide by 0 error
      shopZone = (mouseX - basex) / tabsize;
    }
    else {
      return 0;
    }
    return shopZone;
  }//returnShopZone
  
  void shopSwapper() {
    if (inShopZone()) {
      if (returnShopZone() == 0) {
        currentshop = 0;
      }
      else if (returnShopZone() == 1) {
        currentshop = 1;
      }
      else if (returnShopZone() == 2) {
        currentshop = 2;
      }
      else if (returnShopZone() == 3) {
        currentshop = 3;
      }
        
    }
  }//shopSwapper
  
}//Shops
