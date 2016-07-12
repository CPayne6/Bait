package Game.GameStates;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import org.newdawn.slick.Input;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.BasicGameState;
import org.newdawn.slick.state.StateBasedGame;

import Game.SetupGame;

public class Menu extends BasicGameState{

	Image play;
	
	float playX,playY,playWidth,playHeight;

	@Override
	public void init(GameContainer gc, StateBasedGame sbg) throws SlickException {
		play = new Image("res/play.png");
		playX = gc.getWidth()/3;
		playY = (float)(gc.getHeight()/1.5);
		playWidth = play.getWidth();
		playHeight = play.getHeight();
	}

	@Override
	public void render(GameContainer gc, StateBasedGame sbg, Graphics g) throws SlickException {
		play.drawCentered(playX	,playY);
	}

	@Override
	public void update(GameContainer gc, StateBasedGame sbg, int delta) throws SlickException {
		Input i = gc.getInput();
		if(i.isMousePressed(Input.MOUSE_LEFT_BUTTON)){
			int mX = i.getMouseX();
			int mY = i.getMouseY();
			if(mX>playX - playWidth/2 && mX < playX + playWidth/2 && mY > playY- playHeight/2 && mY < playY + playHeight/2){
				sbg.enterState(SetupGame.playID);
			}
		}
	}

	@Override
	public int getID() {
		return 0;
	}

}