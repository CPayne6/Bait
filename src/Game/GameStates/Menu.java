package Game.GameStates;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.BasicGameState;
import org.newdawn.slick.state.StateBasedGame;

public class Menu extends BasicGameState{

	float bX;
	float bY;

	private static final float gravity = (float) 0.001;

	float vSpeed = 0;

	@Override
	public void init(GameContainer cg, StateBasedGame sbg) throws SlickException {
		bX = 10;
		bY = 10;
	}

	@Override
	public void render(GameContainer gc, StateBasedGame sbg, Graphics g) throws SlickException {
		g.fillRect(bX, bY, 20, 20);
	}

	@Override
	public void update(GameContainer gc, StateBasedGame sbg, int delta) throws SlickException {
		bY += vSpeed;
		if(vSpeed < 0.5)
			vSpeed+=gravity;
	}

	@Override
	public int getID() {
		return 0;
	}

}
