
package Game.GameStates;

import org.newdawn.slick.GameContainer;
import org.newdawn.slick.Graphics;
import org.newdawn.slick.Image;
import org.newdawn.slick.Input;
import org.newdawn.slick.SlickException;
import org.newdawn.slick.state.BasicGameState;
import org.newdawn.slick.state.StateBasedGame;
import Game.Player;

public class Play extends BasicGameState{

	Image background;
	Player fish;
	float scale;
	
	float fishW, fishH;

	private static final float gravity = (float) 0.001;

	@Override
	public void init(GameContainer cg, StateBasedGame sbg) throws SlickException {
		fish= new Player();
		background = new Image("res/underwater background.png");
		scale = (float)0.5;
	}

	@Override
	public void render(GameContainer gc, StateBasedGame sbg, Graphics g) throws SlickException {
		background.drawCentered(200, 250);
		fish.render(g);
	}

	@Override
	public void update(GameContainer gc, StateBasedGame sbg, int delta) throws SlickException {
		fish.update(gc);
	}

	@Override
	public int getID() {
		return 1;
	}

}
