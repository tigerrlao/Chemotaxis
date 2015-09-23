 Bacteria[] bob;
 Prey jim;
 PImage photo;
 void setup()   
 { 
 	size(500,500);
 	jim = new Prey(20,250);
 	//bacteria
 	bob = new Bacteria[75];
 	for(int x = 0; x < bob.length; x++)
 	{
 		int spawnX = (int)(Math.random()*250)+125;
 		int spawnY = (int)(Math.random()*250)+125;
 		bob[x] = new Bacteria(spawnX,spawnY);
 	}
 	photo = loadImage("Portal_Cake.png");
 }   
 void draw()   
 {
 	background(38,35,145);
 	strokeWeight(3);
  	for(int x = 0; x < bob.length; x++)
  	{
 		bob[x].show();
 	}
 	for(int x = 0; x < bob.length; x++)
 	{
 		bob[x].walk();
 	}
 	jim.show();
 	jim.move();
 	image (photo,220,220,60,60);
 	//aquarium
 	noFill();
 	stroke(0);
 	strokeWeight(3);
 	rect(45,45,410,410);
 	for(int lines = 45; lines <= 450; lines = lines + 30)
 	{
 		stroke(255,255,0);
 		line(45,lines,45,lines + 10);
 		line(lines,45,lines + 10,45);
 		line(455,lines,455, lines + 10);
 		line(lines,455,lines + 10, 455);
 	}
 }  
 class Bacteria    
 {     
 	int myX, myY, myColor, colour;
 	Bacteria(int x, int y)
 	{
 		myX = x;
 		myY = y;
 		colour = (int)(Math.random()*255);
 	} 
 	void walk()
 	{
 		if(myX > 215 && myX < 250 && myY > 215 && myY < 285)
 		{
 			myX = myX + (int)(Math.random()*5)-5;
 		}
 		else if(myX < 285 && myX > 250 && myY > 215 && myY <285)
 		{
 			myX = myX + (int)(Math.random()*5);
 		}
 		else if(myX > 445)
 		{
 			myX = myX + (int)(Math.random()*5)-5;
 		}
 		else if(myY > 445)
 		{
 			myY = myY + (int)(Math.random()*5)-5;
 		}
 		else if(myX < 55)
 		{
 			myX = myX + (int)(Math.random()*5);
 		}
 		else if(myY < 55)
 		{
 			myY = myY + (int)(Math.random()*5);
 		}
 		else
 		{
 			myX = myX + (int)(Math.random()*7)-3;
 			myY = myY + (int)(Math.random()*7)-3;
 		}
 	}
 	void show()
 	{
 		myColor = color(255,colour,0);
 		fill(myColor);
 		stroke(myColor);
 		ellipse(myX,myY,20,20);
 	} 
 }    
 class Prey
 {
 	int myX, myY;
 	Prey(int x, int y)
 	{
 		myX = x;
 		myY = y;
 	}
 	void move()
 	{
 		if(keyPressed)
 		{
 			if(key == 'a')
 			{
 				myX = myX - 3;
 			}
 			if(key == 'd')
 			{
 				myX = myX + 3;
 			}
 			if(key == 'w')
 			{
 				myY = myY - 3;
 			}
 			if(key == 's')
 			{
 				myY = myY + 3;
 			}
 		}
 	}
 	void show()
 	{
 		if(get(myX,myY) != color(0,255,0) && get(myX,myY) != color(38,35,145) )
 		{
 			myX = 20;
 			myY = 250;
 		}
 		if(get(myX,myY+3) == color(0,0,0))
 		{
 			myY = 45;
 		}
 		if(get(myX+3,myY) == color(0,0,0))
 		{
 			myX = 45;
 		}
 		noStroke();
 		fill(0,255,0);
 		ellipse(myX,myY,10,10);
 		if(myX >= 220 && myX <= 280 && myY >= 220 && myY <= 280)
 		{
 			fill(255,0,250);
 			textAlign(CENTER);
 			textSize(50);
 			text("The Cake Is a Lie",250,450);
 		}
 	}
 }
