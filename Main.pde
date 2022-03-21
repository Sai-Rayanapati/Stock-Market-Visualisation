
ArrayList<Company> companies;
Screen homeScreen;
Screen currentScreen;

void settings() {
  size(MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
}

void setup() {
  companies = new ArrayList<Company>();
  
  // populate companies array
  BufferedReader companiesFile = createReader("stocks.csv");
  readLineFromCSVFile(companiesFile); // move past headers row
  String[] companyFields;
  while ((companyFields = readLineFromCSVFile(companiesFile)) != null) {
    // format of file is ticker, exchange, name, sector, industry
    companies.add(new Company(companyFields[0], companyFields[1], companyFields[2], companyFields[3], companyFields[4]));
  }
  BufferedReader dailyPricesFile = createReader("daily_prices1k.csv");
  String[] dailyPricesFields;
  while ((dailyPricesFields = readLineFromCSVFile(dailyPricesFile)) !=  null)
  {
    // format of file is ticker, open, close, adj close, low, high, volume, date
    Company company = getCompanyByTicker(dailyPricesFields[0]);
    double openPrice = Double.valueOf(dailyPricesFields[1]);
    double closePrice = Double.valueOf(dailyPricesFields[2]);
    double adjClose = Double.valueOf(dailyPricesFields[3]);
    double low = Double.valueOf(dailyPricesFields[4]);
    double high = Double.valueOf(dailyPricesFields[5]);
    int volume = Integer.valueOf(dailyPricesFields[6]);
    String date = dailyPricesFields[7];
    
    company.addDailyStockPrice(new DailyPrice(openPrice, closePrice, adjClose, low, high, volume, date));
  }
  // build home screen
  homeScreen = new Screen(MAIN_BG);
//  int selectFrom = 10;
//  int selectTo = 30;
//  for (int index = selectFrom, position = 0; index < selectTo; index++, position++) {
//    Company company = companies.get(index);
    // temporarily use buttons to display company data 
//    homeScreen.add(new Button(company.getCompanyTicker(), 10, 10 + (position * (40 + 10)), 90, 40, color(255)));
//    homeScreen.add(new Button(company.getCompanyName(), 100, 10 + (position * (40 + 10)), 300, 40, color(255)));
//    homeScreen.add(new Button(company.getCompanyExchange(), 400, 10 + (position * (40 + 10)), 100, 40, color(255)));
//  }

   Company test = getCompanyByTicker("AMSWA");
   ArrayList<DailyPrice> temp = test.getDailyStockPrices();
   ArrayList<float> x = new ArrayList<float>();
   ArrayList<float> y = new ArrayList<float>();
   for(DailyPrice price : temp)
   {
     x.add((float)price.getOpenPrice());
     y.add((float)price.getClosePrice());
   }
   Graph tempGraph = new Graph(this, 0, 0, 500, 500, "", "", "");
   tempGraph.setPoints(x.toArray(new float[x.size()]), y.toArray(new float[y.size()]));
   homeScreen.add(tempGraph);
  
  // default screen when the program opens is the home screen 
  currentScreen = homeScreen;
}

void draw() {
  currentScreen.draw();
}

void mousePressed() {
  Scrollbar sb = currentScreen.getMouseOverScrollbarHandle(mouseX, mouseY);
  if (sb != null) {
    sb.setDraggedFrom(mouseX, mouseY);
    currentScreen.setDraggedScrollbar(sb);
  }
  else {
    // TODO: decide on a method of distinguishing buttons, so they can be used as triggers for different actions
    Widget clickedWidget = currentScreen.getMouseOver(mouseX, mouseY);
    if (clickedWidget != null) {
      println("Clicked on " + clickedWidget);
    }
  }
}

void mouseDragged() {
  // currently the only thing we have planned that should be draggable are the scrollbars
  Scrollbar sb = currentScreen.getDraggedScrollbar();
  if (sb != null) {
    sb.moveHandle(mouseX, mouseY);
    sb.setDraggedFrom(mouseX, mouseY);
  }
}

void mouseReleased() {
  if (currentScreen.getDraggedScrollbar() != null) {
    currentScreen.setDraggedScrollbar(null);
  }
}

String[] readLineFromCSVFile(BufferedReader file) {
  String line;
  try {
    line = file.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  
  if (line != null) {
    return line.split(",");
  }
  else {
    return null;
  }
}

  Company getCompanyByTicker(String ticker)
{
  for (Company company : companies)
  {
    if(company.ticker.equals(ticker))
    {
      return company;
    }
  }
  return null;  //has not found anything
}
