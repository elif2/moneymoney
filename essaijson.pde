import java.util.*;

float valhigh =0;

void setup() {
  size(800, 400);
  loadData();
}

String apiKey="U8JUT9LOQM4920E6s";

void loadData() {
  // Load the JSON file and grab the array.
  String req = "https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=BTC&market=EUR&apikey="+apiKey;

  JSONObject json = loadJSONObject(req);
  //println(json);

  JSONObject tab = json.getJSONObject("Time Series (Digital Currency Intraday)");
  println(tab.size());

  Iterator i = tab.keys().iterator();
  tabPriceEU = new float[tab.size()];
  tabPriceUSD = new float[tab.size()];
  tabVolume = new float[tab.size()];
  
  int inc=0;
  while (i.hasNext()) {
    String element = (String)i.next();
    // float open = tab.getJSONObject(element).getFloat("1. open");
    float high = tab.getJSONObject(element).getFloat("1a. price (EUR)");
    float low = tab.getJSONObject(element).getFloat("1b. price (USD)");
    float vol= tab.getJSONObject(element).getFloat("2. volume");
    float market= tab.getJSONObject(element).getFloat("3. market cap (USD)");
    // float volume= tab.getJSONObject(element).getFloat("5. volume");
    tabPriceEU[inc] = high;
    tabPriceUSD[inc] = high;


    inc++;
    println(high);
  }
}


float [] tabPriceEU; // Tableau volume prix euros
float [] tabPriceUSD;// Tableau volume prix dollars
float [] tabVolume;
float [] vol;
float ajouter =0;

int divH=10;
int divV=10;




void draw(){

  
  rect(tabPriceEU[1]/100,tabPriceUSD[1]/100,20,20);
  ellipse(tabVolume[1]/1000,tabVolume[2]/1000,20,20);
  rotate(radians(tabPriceEU[2]/100));
  println(tabPriceEU[1]);
  
  class Bloc {
  int x, y, l, h, px, py;
  color col;
int de;
  Bloc(int x, int y, int px, int py, int l, int h) {
    this.x=x;
    this.y=y;
    this.px=px;
    this.py=py;
    this.l=l;
    this.h=h;
    col = color(random(200,250));
    de=int(random(21));
  }

  void aff() {
    fill(col);
    rect(px, py, l, h);
  //  image(tabImage[de],px,py,l,h);
  }
}
  
  
  
  for (int i=0; i<divH; i++) {
    for (int j=0; j<divV; j++) {
      tabBloc[i][j].aff();
    }
  }

 



}