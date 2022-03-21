public class Widget {
  /*
    The Widget class is a parent class for all UI elements.
    Every element added to ArrayList of widgets on a screen must extend this class.
    In effect, this is a template for what every UI element should have.
  */

  float x;
  float y;
  float elemWidth;
  float elemHeight;
  
  
  void draw(float xOffset, float yOffset) {
    // the draw function should be implemented by the class extending Widget
  }
  
  boolean isMouseOver(float xMouse, float yMouse) {
    return (xMouse >= this.x && xMouse <= this.x + elemWidth &&
            yMouse >= this.y && yMouse <= this.y + elemHeight);
  }
  
  // getters
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
  
  float getElementWidth() {
    return this.elemWidth;
  }
  
  float getElementHeight() {
    return this.elemHeight;
  }
  
  // setters
  void setX(float x) {
    this.x = x;
  }
  
  void setY(float y) {
    this.y = y;
  }
  
  void setElementWidth(float elemWidth) {
    this.elemWidth = max(elemWidth, 0);  // element width has to be positive
  }
  
  void setElementHeight(float elemHeight) {
    this.elemHeight = max(elemHeight, 0);  // element height has to be positive
  }
}
