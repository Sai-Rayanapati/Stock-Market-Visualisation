import java.util.ArrayList;

public class Screen {
  /*
    The Screen class is used to hold a collection of widgets and their arrangements.
    It will handle scrolling the active viewport in the case that content goes over the edge.
  */
  
  private ArrayList<Widget> widgets;
  
  private Scrollbar xScrollbar;
  private Scrollbar yScrollbar;
  private Scrollbar draggedScrollbar;
  
  private float screenWidth;
  private float screenHeight;
  
  private color bgColor;

  Screen(color bgColor) {
    this.bgColor = bgColor;
    
    // set inital values for the screen dimensions
    this.screenWidth = width;
    this.screenHeight = height;
    
    this.widgets = new ArrayList<Widget>();
  }
  
  void add(Widget widget) {
    widgets.add(widget);
    
    // check whether the added element means the screen has to get wider
    if (widget.getX() + widget.getElementWidth() > screenWidth) {
      screenWidth = widget.getX() + widget.getElementWidth();
    }
    // check whether the added element means the screen has to get longer
    if (widget.getY() + widget.getElementHeight() > screenHeight) {
      screenHeight = widget.getY() + widget.getElementHeight();
    }
  }
  
  void draw() {
    background(bgColor);
    // values of `width` and `height` are not correct until the main draw method is run, so instantiate them here instead.
    if (this.xScrollbar == null || this.yScrollbar == null) {
      // TODO: tidy this up - Cian
      // calculate appropriate handle length for vertical scrollbar
      float xHandleLength = width/screenWidth * (width - 2*SCROLLBAR_WIDTH);
      this.xScrollbar = new Scrollbar("horizontal", 0, height - SCROLLBAR_WIDTH, SCROLLBAR_WIDTH, width - SCROLLBAR_WIDTH, xHandleLength);
      // calculate appropriate handle length for vertical scrollbar
      float yHandleLength = height/screenHeight * (height - 2*SCROLLBAR_WIDTH);
      this.yScrollbar = new Scrollbar("vertical", width - SCROLLBAR_WIDTH, 0, SCROLLBAR_WIDTH, height - SCROLLBAR_WIDTH, yHandleLength);
    }
    
    // loop through all elements in widget list and draw them
    for (int index = 0; index < widgets.size(); index++) {
      // TODO: replace 0, 0 with the current scroll position
      float xScrollOffset = lerp(xScrollbar.getCurrentPosition(), 0, screenWidth - width);
      float yScrollOffset = lerp(yScrollbar.getCurrentPosition(), 0, screenHeight - height);
      widgets.get(index).draw(xScrollOffset, yScrollOffset); 
    }
    
    // if the viewport isn't wide/long enough to show everything, draw scrollbars
    if (xScrollbarNeeded()) {
      xScrollbar.draw();
    }
    if (yScrollbarNeeded()) {
      yScrollbar.draw();
    }

  }
  
  boolean xScrollbarNeeded() {
    return screenWidth > width;
  }
  
  boolean yScrollbarNeeded() {
    return screenHeight > height;
  }
  
  Widget getMouseOver(float x, float y) {
    // elements later in the widget list are drawn on top of earlier ones
    // so work through widget list in reverse order
    for (int index = widgets.size() - 1; index >= 0; index--) {
      Widget widget = widgets.get(index);
      if (widget.isMouseOver(x, y)) {
        return widget;
      }
    }
    // for loop has finished without finding a widget
    return null;
  }
  
  Scrollbar getMouseOverScrollbarHandle(float x, float y) {
    if (xScrollbarNeeded()) {
      if (xScrollbar.isMouseOverHandle(x, y)) {
        return xScrollbar;
      }
      // TODO: check arrows forward and back
    }
    if (yScrollbarNeeded()) {
      if (yScrollbar.isMouseOverHandle(x, y)) {
        return yScrollbar;
      }
      // TODO: check arrows forward and back
    }
    
    // not over any scrollbar handles
    return null;
  }
  
  void setDraggedScrollbar(Scrollbar sb) {
    this.draggedScrollbar = sb;
  }
  
  Scrollbar getDraggedScrollbar() {
    return this.draggedScrollbar;
  }
  
}
