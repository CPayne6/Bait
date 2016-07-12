package Game;

import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;

public class NPC {
	
	float x,y;
	Image fish;
	boolean position;
	float scale;
	
	public NPC(){
		int num = (int)(Math.random()*2);
		if(num>0){
			//set right facing image
			position = true;
		}
		else{
			//set left facing image
			position = false;
		}
		scale = (float)Math.random();
	}
	
	public void render(Graphics g){
		fish.draw(x, y, scale);
	}
	
	public void move(){
		if(position){
			x+=1;
		}
		else{
			x-=1;
		}
	}
}
