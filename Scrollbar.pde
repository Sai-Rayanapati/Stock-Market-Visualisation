public class Scrollbar {
  
  /*
    The Scrollbar class is used by the Screen class to move the the active viewing area.
  */ 

  private String orientation;
  private float x;
  private float y;
  private float sbWidth;
  private float sbLength;
  private float handleLength;
  private float progress;  // a number from 0 to 1 indicating how far along the scrollbar has scrolled.
  private float draggedFrom;
 

  Scrollbar(String orientation, float x, float y, float sbWidth, float sbLength, float handleLength) {
    if (orientation.equalsIgnoreCase("vertical") ||
        orientation.equalsIgnoreCase("horizontal")) {
      this.orientation = orientation.toLowerCase();
    } else {
      println("Invalid scrollbar orientation, defaulting to vertical");
      this.orientation = "vertical";
    }
    this.x = x;
    this.y = y;
    this.sbWidth = sbWidth;
    this.sbLength = sbLength;
    this.handleLength = handleLength;
    this.progress = 0.0;
  }
  
  Scrollbar(String orientation, float x, float y, float sbWidth, float sbHeight,float handleLength, float progress) {
    this(orientation, x, y, sbWidth, sbHeight, handleLength);
    this.progress = progress;
  }

  void draw() {
    if (orientation.equals("vertical")) {
      // background
      fill(SCROLLBAR_BG);
      rect(x, y, sbWidth, sbLength);
      
      // arrows
      fill(SCROLLBAR_ARROW);
      triangle(x + sbWidth/2, y + sbWidth/6, x + 5*sbWidth/6, y + 5*sbWidth/6, x + sbWidth/6, y + 5*sbWidth/6);
      triangle(x + sbWidth/6, y + sbLength - 5*sbWidth/6, x + 5*sbWidth/6, y + sbLength - 5*sbWidth/6, x + sbWidth/2, y + sbLength - sbWidth/6);
      
      // handle
      fill(SCROLLBAR_HANDLE);
      rect(x + SCROLLBAR_WIDTH*0.05, y + SCROLLBAR_WIDTH + getHandleOffset(), SCROLLBAR_WIDTH*0.9, handleLength);
    }
    
    if (orientation.equals("horizontal")) {
      // background
      fill(SCROLLBAR_BG);
      rect(x, y, sbLength, sbWidth);
      
      // arrows
      fill(SCROLLBAR_ARROW);
      triangle(x + sbWidth/6, y + sbWidth/2, x + 5*sbWidth/6, y + sbWidth/6, x + 5*sbWidth/6, y + 5*sbWidth/6);
      triangle(x + sbLength - 5*sbWidth/6, y + sbWidth/6, x + sbLength - sbWidth/6, y + sbWidth/2, x + sbLength - 5*sbWidth/6, y + 5*sbWidth/6);
      
      // handle
      fill(SCROLLBAR_HANDLE);
      rect(x + SCROLLBAR_WIDTH + getHandleOffset(), y + SCROLLBAR_WIDTH*0.05, handleLength, SCROLLBAR_WIDTH*0.9);
    }
    
  }
  
  void setDraggedFrom(float xMouse, float yMouse) {
    if (this.orientation.equals("vertical")) {
      this.draggedFrom = yMouse;
    }
    if (this.orientation.equals("horizontal")) {
      this.draggedFrom = xMouse;
    }
  }
  
  void moveHandle(float xMouse, float yMouse) {
    float difference;
    if (this.orientation.equals("vertical")) {
      difference = yMouse - draggedFrom;
    }
    else {
      difference = xMouse - draggedFrom;
    }
    
    // Explanation of next line of code:
    
    // smallest coordinate the handle is going to start at is
    //   sbWidth
    // biggest coordinate the handle is going to start at is
    //   screenHeight - sbWidth - handleLength
    
    // Therefore the range of the variable `difference` is  sbWidth - (sbLength - sbWidth - handleLength) through 0 to (sbLength - sbWidth - handleLength) - sbWidth
    // So map range of differences to a range from -1 to 1
    // then always add this mapped value on to the current progress
    
    this.progress += map(difference, sbWidth - (sbLength - sbWidth - handleLength), (sbLength - sbWidth - handleLength) - sbWidth, -1, 1);
    
    // you shouldn't be able to scroll past the top or botton of the screen
    // so constrain the progress value to be between 0 and 1
    this.progress = constrain(this.progress, 0, 1);
  }

  float getCurrentPosition() {
    return this.progress;
  }
  
  float getHandleOffset() {
    return lerp(0, sbLength - handleLength - 2*sbWidth, this.progress);
  }
  
  boolean isMouseOverHandle(float xMouse, float yMouse) {
    if (this.orientation.equals("vertical")) {
      return (xMouse >= this.x + sbWidth*0.05 && xMouse <= this.x + sbWidth * 0.9 &&
              yMouse >= this.y + sbWidth + getHandleOffset() && yMouse <= this.y + sbWidth + getHandleOffset() + handleLength);
    }
    else {
      return (xMouse >= this.x + sbWidth + getHandleOffset() && xMouse <= this.x + sbWidth + getHandleOffset() + handleLength &&
              yMouse >= this.y + sbWidth*0.05 && yMouse <= this.y + sbWidth * 0.9);
    }
  }

}
