class ShopTab {
  
  int x;
  int y;
  int tsize;
  int shoptype;
  
  ShopTab(int _x, int _y, int _tsize, int stype) {
    x = _x;
    y = _y;
    tsize = _tsize;
    shoptype = stype;
  }//constructor
  
  void displayTab() {
    strokeWeight(5);
    stroke(0);
    fill(#CBC0AD);
    square(x,y,tsize);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(shoptype+1,x+tsize/2,(y+tsize/2)+10);
  }//displayTab
}
