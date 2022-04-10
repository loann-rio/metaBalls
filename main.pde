int nb_circle = 10;
float[][] circles = new float[nb_circle][3];

float r = 0.05;  // r smaller ==> larger circle

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
  
  for (int i = 0; i<1200; i+=1)
  {
     for (int j = 0; j<1200; j+=1)
     {
       
       float weight = f(mouseX, mouseY, i, j, 3);
       for (int k = 0; k<nb_circle; k++)
       {
         weight += f(circles[k][0], circles[k][1], i, j, circles[k][2]);
       }
       
       if (abs((weight)-r) < 0.0005)
       {
         fill(255, 0, 0, 255);
         circle(i, j, 2);
       }
       
       else if (abs((weight)-0.1) < 0.0005)
       {
         fill(0, 0, 255);
         circle(i, j, 2);
       }
       
       else if (abs((weight)-0.07) < 0.0005)
       {
         fill(0, 255, 0);
         circle(i, j, 2);
       }
       
       else if (abs((weight)-0.06) < 0.0005)
       {
         fill(255, 255, 0);
         circle(i, j, 2);
       }
       
       else if (abs((weight)-0.08) < 0.0005)
       {
         fill(0, 255, 255);
         circle(i, j, 2);
       }
       
       
       
       
     }
  }

}

float f(float x1, float y1, int x2, int y2, float cr)
{
  return cr/ ( sqrt( pow( (x2-x1) ,2)+pow( (y2-y1) ,2)) );
}
