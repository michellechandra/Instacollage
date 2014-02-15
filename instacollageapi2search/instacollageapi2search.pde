/* 

Michelle Chandra
ITP - NYU (Introduction to Computational Media)
Fall 2013
michelle.chandra@gmail.com

This sketch was created with help from Dan Shiffman and Uttam Grandhi. 
Sketch makes calls to Instagram API and creates collages out of most
recent images based on tags. To use, you must register with Instagram API
and insert your Client ID. Press mouse to generate new collage and 
save screenshot of most recent collage. 

*/ 

boolean button;

int x = 0;
int w = 2;

PImage img1;
PImage img2;

JSONObject photos = loadJSONObject("https://api.instagram.com/v1/tags/"PUT YOUR TAG KEYWORD HERE"/media/recent?"INSERT YOUR CLIENT ID HERE");
JSONObject photos2 = loadJSONObject("https://api.instagram.com/v1/tags/"PUT YOUR TAG KEYWORD HERE"/media/recent?"INSERT YOUR CLIENT ID HERE");

String url = photos.getJSONArray("data").getJSONObject(0).getJSONObject("images").getJSONObject("standard_resolution").getString("url");

String url1 = photos2.getJSONArray("data").getJSONObject(1).getJSONObject("images").getJSONObject("standard_resolution").getString("url");

void setup() {
button = false;
size(612,612);
img1 = loadImage(url, "jpg");
img2 = loadImage(url1, "jpg");
}

// Make me a new instacollage!
void draw() {

 while (x < width) { 

  PImage slice1 = img1.get(x+w, 0, w, 640);
  image(slice1, x+w, 0, w, 640);
  
  PImage slice2 = img2.get(x, 0, w, 640);
  image(slice2, x, 0, w, 640);

x = x+3;
}
}

void mousePressed(){
  // Grab new images randomly
  // Create a new collage whenever mouse is pressed
  //println("test");
  x=0;
 
  // Call Again to Instagram API
photos = loadJSONObject("https://api.instagram.com/v1/tags/"INSERT YOUR TAG KEYWORD HERE"/media/recent?"INSERT YOUR CLIENT ID HERE");
photos2 = loadJSONObject("https://api.instagram.com/v1/tags/"INSERT YOUR TAG KEYWORD HERE"/media/recent?"INSERT YOUR CLIENT ID HERE");

url = photos.getJSONArray("data").getJSONObject(0).getJSONObject("images").getJSONObject("standard_resolution").getString("url");

url1 = photos2.getJSONArray("data").getJSONObject(1).getJSONObject("images").getJSONObject("standard_resolution").getString("url");

  // Load the new collage mashup
  img1 = loadImage(url, "jpg");
  img2 = loadImage(url1, "jpg");
  
  // Save the result!
  saveFrame();

}

