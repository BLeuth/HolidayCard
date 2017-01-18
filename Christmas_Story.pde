void setup(){
  size(1000,600);
  background(0);
}
PImage man = loadImages("SimpleOrnamentc.png");
void draw(){
  background(man);
}

/*//Link for story https://americanliterature.com/christmas
PImage bookshelf;
Boolean main = true;
Boolean storyTime = false;

void setup(){
  size(1000,600);
  loadAllImages();
}

void draw(){
  if(main){
    background(bookshelf);
    bookCovers();
  }
  else if(storyTime){
    //background(255);
  }
}

PImage bcMc; //bookcover for Merry Christmas by Stephen Leacock
PImage bcFt; //bookcover for FirTree
PImage bcSo  ; //bookcover for Simple Ornament by Bailey
void bookCovers(){ 
  //col1 xCoord=100  row2 yCoord=210
  image(bcMc, 100, 5);    //book 1
  image(bcFt, 100, 210);  //book4
  image(bcSo, 430, 210);    //book 5
  
}

String[] story;
void loadStory(int index){
  Story book = new Story(index);
  book.loadStory();
  //story = loadStrings(book.getStoryName()+"/"+book.getStoryName()+".txt");
}

/*void runStory(int page){
  fill(0);
  text(story[page],10,10);
}

void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  
  if(main){
    int temp = getSpot(x,y);
    if(temp>0){
      loadStory(temp);
    }
    pageNum=-1;
  }
}

int getSpot(int xCoord, int yCoord){
  PImage temp;
  //Book spot 1
  if(xCoord>100&&xCoord<240&&yCoord>5&&yCoord<185){
    main = false;
    storyTime = true;
    background(0);
    textAlign(CENTER);
    text("Book Cover goes here",500,300);
    return 1;
  }
  
  //Book spot 4
  else if(xCoord>100&&xCoord<240&&yCoord>210&&yCoord<395){
    main = false;
    storyTime = true;
    background(0);
    textAlign(CENTER);
    text("Book Cover goes here",500,300);
    return 4;
  }
  
  //Book spot 5
  else if(xCoord>430&&xCoord<570&&yCoord>210&&yCoord<395){
    temp = loadImage("SimpleOrnamentc.png");
    main = false;
    storyTime = true;
    //background(255);
    background(temp);
    return 5;
  }
  
  return 0;
}

void loadAllImages(){
  bookshelf = loadImage("http://www.bitpine.com/av/storage/77ba951d/avb23bd5338f51a2f770a.jpg");
  bookshelf.resize(1000,600);
  //book covers
  bcMc = loadImage("http://images.gr-assets.com/books/1445558966l/27258460.jpg");
  bcMc.resize(140,180);
  bcFt = loadImage("http://usa.um.dk/~/media/USA/Images/Christmas2/TheFirTree1.jpg?w=417&h=500&as=1");
  bcFt.resize(140,185);
  bcSo = loadImage("SimpleOrnamentbc.png");
  bcSo.resize(140,180);
}

void runStory(int page){
  textAlign(CENTER);
  textSize(16);
  Story text = new Story(story[page]);
  text.placeText();
  //text(story[page],750,300);
  
  placePics(page);
}

void placePics(int page){
  try{
    PImage illus = loadImage(sn+"/"+sn+page+".png");
    illus.resize(500,600);
    image(illus,0,0);
  } catch(Exception e){
    fill(0);
    rect(0,0,500,600);
    fill(255);
    textAlign(CENTER);
    text("Image can't be found", 250, 300);
  }
  
}

int pageNum = -1;
void keyPressed(){
  if(storyTime){
    if(keyCode == RIGHT){
     background(255);
     fill(0);
     pageNum++;//=2;
     if(pageNum>story.length-1){
       storyTime = false;
       main = true;
     }else{
     runStory(pageNum);   
     }
    } else if(keyCode == LEFT){
     background(255);
     pageNum--;//=2;
     if(pageNum<0){
       storyTime = false;
       main = true;
     }else{
     runStory(pageNum);   
     }   
    }
  }
}

String sn = "";
class Story {
  
  int storyNum;
  String storyName;
  
  Story(int sN){
    storyNum = sN;
    setStoryName();
  }
  
  String text;
  Story(String passage){
    text = passage;
  }
  
  void placeText(){
    String[] passage = text.split("\\s+");
    String finished = "";
    
    int passSize = passage.length;
    int passSize2 = passSize-1;
    int finalIndex = 0;
    int beginIndex = -1;
    int lineSize = 0;
    int yFactor = -1;
    while(beginIndex<passSize2){
      lineSize=0;
      beginIndex++;
      for(int i=beginIndex; i<passSize; i++){
        if(lineSize<36){
          lineSize += passage[i].length();
          finalIndex = i;
        }
      }
      for(int i=beginIndex; i<=finalIndex; i++){
        finished += " " + passage[i];
      }
      beginIndex = finalIndex;
      finalIndex = 0;
      finished += "\n";
      yFactor++;
   }
      text(finished, 750, 300-(12*yFactor));
    
  }
  
  void setStoryName(){
    if(storyNum==1){
      storyName = "MerryChristmas";
    } else if(storyNum==4){
      storyName = "FirTree";
    } else if(storyNum==5){
      storyName = "SimpleOrnament";
    }
    sn = storyName;
  }
  
  void loadStory(){
    story = loadStrings(storyName+"/"+storyName+".txt");
  }
  
  int getStoryNum(){
    return storyNum;  
  }
  
  String getStoryName(){
    return storyName;
  }
  
  /*String getPassage(int index){
    String passage = story[index];
    return passage;
  }
  
}*/
