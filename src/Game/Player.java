package Game;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import org.newdawn.slick.Input;
import org.newdawn.slick.SlickException;

public class Player {

	private static final float gravity = (float) 0.0005;


	float ySpeed, xSpeed;
	float x;
	float y;
	float scale = (float)0.5;
	float friction = (float) 0.001;
	Image fish;
	boolean inversed = false;
	float fishW, fishH;

	public Player() throws SlickException{
		fish = new Image("res/yellowFish.png");
		ySpeed = 0;
		xSpeed = 0;
		x = 200;
		y = 300;
	}

	public void render(Graphics g){
		fish.draw(x, y, scale);
	}

	public void jumpRight(){
		ySpeed =  (float)-0.4;
		xSpeed += (float) 0.05;
		inversed = false;
	}

	public void jumpLeft(){
		ySpeed =  (float)-0.4;
		xSpeed -= (float) 0.05;
		inversed = true;
	}

	public void eat(){
		scale += 0.02;
	}

	public float getX(){
		return x;
	}

	public float getY(){
		return y;
	}

	public float getXSpeed(){
		return xSpeed;
	}

	public float getYSpeed(){
		return ySpeed;
	}

	public void fall(){
		y += ySpeed;
	}
	public void update(GameContainer gc) throws SlickException{
		Input i = gc.getInput();

		fishW = fish.getWidth()*scale;
		fishH = fish.getHeight()*scale;
		fall();

		if((x <=0 && xSpeed < 0) || (x + fishW >=gc.getWidth() && xSpeed > 0)){
			xSpeed = 0;
		}

		if(y+fishH > 550){
			ySpeed = 0;
			if(xSpeed>0){
				xSpeed -= friction;
			}
			else if(xSpeed < 0){
				xSpeed += friction;
			}	 
		}

		if(i.isKeyPressed(Input.KEY_RIGHT)){
			jumpRight();
		}
		else if(i.isKeyPressed(Input.KEY_LEFT)){
			jumpLeft();
		}


		if(i.isKeyPressed(Input.KEY_SPACE)){
			eat();
		}

		x += xSpeed;
		ySpeed+= gravity;

	}
}
