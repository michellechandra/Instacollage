/*

Michelle Chandra
ITP - NYU (Introduction to Computational Media)
Fall 2013
michelle.chandra@gmail.com

This sketch was created with as part of my Introduction to Computational Media Course
at ITP - NYU.

This sketch takes images loaded in data folder to create collages. 
Any images can be used. Change the size of the window to match
the size of the images.

*/


// Total number of images
int maxImages = 5;
int x = 0;  
int w = 1;

// Initial image to be displayed is the first
int indexA = 1;
int indexB = 1;

// Set up an array of images as a global variable
PImage [] images = new PImage[maxImages];

void setup() {
  size(612, 612);
  for (int i = 0; i < images.length; i++) {
  images[i] = loadImage("photo" + i + ".jpg");
  //noLoop();
  }
  
  indexA = int(random(maxImages));
  indexB = int(random(maxImages));
}

void draw() { 

  while (x < width) { 
  
  PImage slice1 = images[indexA].get(x+w, 0, w, 640);
  image(slice1, x, 0, w, 640);

  PImage slice2 = images[indexB].get(x, 0, w, 640);
  image(slice2, x+w, 0, w, 640); 

   x = x+2;
 }
  
}
void mousePressed(){
  // Reset x in order to draw again
  // Grab new images randomly
  // Create a new collage whenever mouse is pressed
  x=0;
  indexA = int(random(maxImages));
  indexB = int(random(maxImages));
  saveFrame();
}
  
  
