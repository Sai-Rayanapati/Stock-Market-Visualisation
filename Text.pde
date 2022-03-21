// text class to display all the text
// text class created 18/03/2020 by :
// Prathamesh Sai 
// Subrahmanyam Rayanapati 


public class Text extends Widget {
  
    private PFont font;
    private String text;
    private int size;
    private int textXPosition;
    private int textYPosition;
    
    Text(String text, PFont font, int size, int textXPosition,int textYPosition ) {
      this.text = text;
      this.font = font;
      this.size = size;
      this.textXPosition= textXPosition;
      this.textYPosition= textYPosition; 
    }
    
  void draw() {
    textFont(font);
    textSize(size);
   text(text, textXPosition, textYPosition); 
   
  }
  
}
