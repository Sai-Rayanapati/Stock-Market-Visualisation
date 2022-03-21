// daily prices class created - M.Dowse @17:40 12/03/2020
// renamed DailyPrices to DailyPrice - C. Mawhinney @13:00 15/03/2020

public class DailyPrice
{
  private double openPrice;
  private double closePrice;
  private double adjustedClose;
  private double low;
  private double high;
  private int volume;
  private String date;
  
  
  
  DailyPrice(double openPrice, double closePrice, double adjustedClose, 
  double low, double high, int volume, String date)
  {
    this.openPrice = openPrice;
    this.closePrice = closePrice;
    this.adjustedClose = adjustedClose;
    this.low = low;
    this.high = high;
    this.volume = volume;
    this.date = date;
  }
  
  double getOpenPrice()
  { 
    return openPrice;
  }
  
  void setOpenPrice(double openPrice)
  {
    this.openPrice = openPrice;
  }
  
  double getClosePrice()
  {
    return closePrice;
  }
  
  void setClosePrice(double closePrice)
  {
    this.closePrice = closePrice;
  }
  
  double getAdjustedClose()
  {
    return adjustedClose;
  }
  
  void setAdjustedlose(double adjustedClose)
  {
    this.adjustedClose = adjustedClose;
  }
  
  double getLow()
  {
    return low;
  }
  
  void setLow(double low)
  {
    this.low = low;
  }
  
  double getHigh()
  {
    return high;
  }
  
  void setHigh(double high)
  {
    this.high = high;
  }
  
  int getVolume()
  {
    return volume;
  }
  
  void setVolume(int volume)
  {
    this.volume = volume;
  }
  
  String getDate()
  {
    return date;
  }
  
  void setDate(String date)
  {
    this.date = date;
  }
  
  
}
