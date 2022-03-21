public class Company {
  private String ticker;
  private String exchange;
  private String name;
  private String sector;
  private String industry;
  
  private ArrayList<DailyPrice> dailyStockPrices;
  
  Company (String ticker, String exchange, String name, String sector, String industry) {
    this.ticker = ticker;
    this.exchange = exchange;
    this.name = name;
    this.sector = sector;
    this.industry = industry;
    this.dailyStockPrices = new ArrayList<DailyPrice>();
  }
  
  void loadStockPrices() {
    // TODO: implement this function
  }
  
  
  // getters
  String getCompanyName() {
    return this.name;
  }
  
  String getCompanyTicker() {
    return this.ticker;
  }
  
  String getCompanyExchange() {
    return this.exchange;
  }
  
  String getCompanySector() {
    return this.sector;
  }
  
  String getCompanyIndustry() {
    return this.industry;
  }
  
  ArrayList<DailyPrice> getDailyStockPrices(){
    return this.dailyStockPrices;
  }
  
  // setters (for the sake of completeness more than anything)
  void updateCompanyName(String name) {
    this.name = name;
  }
  
  void updateCompanyTicker(String ticker) {
    this.ticker = ticker;
  }
  
  void updateCompanyExchange(String exchange) {
    this.exchange = exchange;
  }
  
  void updateCompanySector(String sector) {
    this.sector = sector;
  }
  
  void updateCompanyIndustry(String industry) {
    this.industry = industry;
  }
  
  void addDailyStockPrice(DailyPrice price) {
    dailyStockPrices.add(price);
  }

  
}
