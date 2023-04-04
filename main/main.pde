int nb_circle = 10;
float[][] circles = new float[nb_circle][3];

float r = 0.05;  // r smaller ==> larger circle

int sizewindow = 1200;
int filter = 100;
int Highres = (int) sizewindow/filter;
// the code will do a first maping with low resolution and get a better one only when necessary
// filter is the size of the first maping

void setup()
{
  size(1200, 1200);
  noStroke() ;
  for (int i = 0; i< nb_circle; i++)
  {
    circles[i] = new float[] {random(0, 1200), random(0, 1200),  random(0.5, 3)};
  }

}

void draw()
{
  background(255, 255, 255);
  
  for (int x = 0; x<1200; x+= (int) 1200/filter)
  {
     for (int y = 0; y<1200; y+= (int) 1200/filter)
     {
       float weight = f(mouseX, mouseY, x, y, 3);
       for (int k = 0; k<nb_circle; k++)
       {
         weight += f(circles[k][0], circles[k][1], x, y, circles[k][2]);
       }
       
       if (weight > 0.04)
       {
          for (int i=x; i<x+Highres; i++)
          {
            for (int j=y; j<y+Highres; j++)
            {
              int[] newcolor = getcolor(i, j);
              if (newcolor != null)
              {
                fill(newcolor[0], newcolor[1], newcolor[2]);
                circle(i, j, 2);  
              }
            }
          }
       }  
     }
  }
}

float f(float x1, float y1, int x2, int y2, float cr)
{
  return cr/ ( sqrt( pow( (x2-x1) ,2)+pow( (y2-y1) ,2)) );
}

int[] getcolor(int i, int j) 
{
   float weight = f(mouseX, mouseY, i, j, 3);
   for (int k = 0; k<nb_circle; k++)
   {
     weight += f(circles[k][0], circles[k][1], i, j, circles[k][2]);
   }
   
   if (abs((weight)-r) < 0.0005)
   {     
     return new int[] {255, 0, 0};
   }
   
   if (abs((weight)-0.1) < 0.0005)
   {
     return new int[] {0, 0, 255};
   }
   
   if (abs((weight)-0.07) < 0.0005)
   {
     //circle(i, j, 2);
     return new int[] {0, 255, 0};
   }
   
   if (abs((weight)-0.06) < 0.0005)
   {
     return new int[] {255, 255, 0};
   }
   
   if (abs((weight)-0.08) < 0.0005)
   {
     return new int[] {0, 255, 255};
   }
   
   return null;
 }
