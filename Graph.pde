// graph class to visualise data,
// created on 16/03/2020 3pm by Matthew Dowse

// need array of x points (days etc)
// need array of y points (price €)

import grafica.*;  // graph library

public class Graph extends Widget
{
  String xLabel;
  String yLabel;
  
  GPlot plot;
  
  Graph(PApplet parent, float x, float y, float elemWidth, float elemHeight, String title, String xLabel, String yLabel)
  {  
    this.x = x;
    this.y = y;
    this.elemWidth = elemWidth;
    this.elemHeight = elemHeight;
    this.xLabel = xLabel;
    this.yLabel = yLabel;
    this.plot = new GPlot(parent, x, y, elemWidth, elemHeight);
    this.plot.setTitleText(title);
    this.plot.getXAxis().setAxisLabelText(xLabel);
    this.plot.getYAxis().setAxisLabelText(yLabel);
  }
  
  void setPoints(float[] x, float[] y)
  {  
    if(x.length == y.length)
    {
    GPointsArray points = new GPointsArray(x, y);
    plot.setPoints(points);
    }
  }
  
  void draw(float xOffset, float yOffset)
  {
    plot.defaultDraw();
  }
 
}
