//Menu types
int STARTMENU = 0;
int MENU1 = 1;
int MENU2 = 2;
int CMENU = 3;

//data values
long cookies = 0L;
long totalcookies = 0L;
long cpc = 1L;
long pcps = 0L;
int ascensioncount = 0;
long sugarlumps = 0L;
int clicks = 0;

//discounts, cps and cpc modifiers
float cpcboost = 1;
float cpsboost = 1;
float cookieboost = 1;
boolean cmboost = false;
boolean discount = false;
boolean symbiosis = false;
boolean goldencookie = false;
float cmformula;
float symformula;

//fonts
PFont cookiefont;

//cookie types
int REGULAR = 0;
int WALNUT = 1;
int OATMEAL = 2;
int GINGER = 3;
int SILVER = 4;
int SKETCH = 5;
int BURNT = 6;
int BLACKHOLE = 7;
int REVERSE = 8;

//driver vars
Cookie cookie;
Menu menu;
Upgrades upgrade;
Shops shop;
Ascension ascension;
int COOKIETYPE = REGULAR;
boolean cookiepressed = false;
boolean ascending = false;
int numupgrades = 8;
int numtabs = 4;
int cursorcount = 0;
int maxcursorcount = 4;
int currentshop = 0;

void setup() {
  frameRate(60);
  size(900, 700);
  cookie = new Cookie();
  menu = new Menu();
  upgrade = new Upgrades(numupgrades, numtabs);
  shop = new Shops(numtabs);
  ascension = new Ascension();
  cookiefont = createFont("Kavoon-Regular.ttf", 32);
  textFont(cookiefont);
}

void draw() {
  cmformula = 1 + ((int(clicks / 50) * 0.01));
  symformula = pcps * 0.35 * cookieboost * (pow(2,cpsboost-1));
  background(#5bbce4);
  cookie.display(COOKIETYPE);
  menu.displayMenu();
  upgrade.showBox();
  shop.showTab();
  ascension.ascensiondisplay();
  if (ascending == true) {
    ascension.performascension();
  }
  if (frameCount % 60 == 0) {
    cookies += pcps * cookieboost * (pow(2,cpsboost-1));
    totalcookies += pcps * cookieboost * (pow(2,cpsboost-1));
  }
  if (frameCount % 30 == 0 & cursorcount >= 0) {
      cookies += ((cursorcount + (goldencookie ? 10 : 0)) * (cmboost ? cmformula : 1) * ((cpc * cookieboost * pow(2,cpcboost-1)) + (symbiosis ? symformula : 0)));
      totalcookies += ((cursorcount + (goldencookie ? 10 : 0)) * (cmboost ? cmformula : 1) * ((cpc * cookieboost * pow(2,cpcboost-1)) + (symbiosis ? symformula : 0)));
      clicks += cursorcount + (goldencookie ? 10 : 0);
  }
}

void mousePressed() {
  if (cookie.cookiecheck()) {
    cookies += (cmboost ? cmformula : 1) * ((cpc * cookieboost * pow(2,cpcboost-1)) + (symbiosis ? symformula : 0));
    totalcookies += (cmboost ? cmformula : 1) * ((cpc * cookieboost * pow(2,cpcboost-1)) + (symbiosis ? symformula : 0));
    clicks += 1;
    cookie.shrink();
    cookiepressed = true;
  } 
    shop.shopSwapper();
    ascension.menuSwapper();
    upgrade.upgradeItem();
    
}
  
void mouseReleased() {
  if (cookiepressed == true) {
    cookie.grow();
    cookiepressed = false;
  }
}
