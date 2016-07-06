package Game.GameStates;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import org.newdawn.slick.Input;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.BasicGameState;
import org.newdawn.slick.state.StateBasedGame;

public class Menu extends BasicGameState{

	Image fish;
	boolean inversed = false;
	float x;
	float y;
	float scale;
	float friction = (float) 0.001;
	
	float fishW, fishH;

	private static final float gravity = (float) 0.001;

	float ySpeed, xSpeed;

	@Override
	public void init(GameContainer cg, StateBasedGame sbg) throws SlickException {
		fish = new Image("res/clown.png");
		scale = (float)0.5;
	}

	@Override
	public void render(GameContainer gc, StateBasedGame sbg, Graphics g) throws SlickException {
		if(inversed){
			fish.getFlippedCopy(true,false).draw(x, y, scale);
		}
		else{
			fish.draw(x, y, scale);
		}
		
	}

	@Override
	public void update(GameContainer gc, StateBasedGame sbg, int delta) throws SlickException {
		Input i = gc.getInput();
		y += ySpeed;
		if(y+fishH > 550){
			ySpeed = 0;
			if(xSpeed>0){
				xSpeed -= friction;
			}
			else if(xSpeed < 0){
				xSpeed += friction;
			}
		}
		else if(ySpeed < 0.5){
			ySpeed+=gravity;
		}
		if(i.isKeyPressed(Input.KEY_RIGHT)){
			ySpeed =  (float)-0.4;
			xSpeed += (float) 0.05;
			inversed = false;
		}
		else if(i.isKeyPressed(Input.KEY_LEFT)){
			ySpeed =  (float)-0.4;
			xSpeed -= (float) 0.05;
			inversed = true;
		}
		
		if(i.isKeyPressed(Input.KEY_SPACE)){
			scale +=0.02;
		}
		
		x += xSpeed;
		
		fishW = fish.getWidth()*scale;
		fishH = fish.getHeight()*scale;
	}

	@Override
	public int getID() {
		return 0;
	}

}
