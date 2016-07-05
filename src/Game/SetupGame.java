package Game;

import org.newdawn.slick.*;
import org.newdawn.slick.state.StateBasedGame;

import Game.GameStates.GameOver;
import Game.GameStates.Menu;
import Game.GameStates.Play;

public class SetupGame extends StateBasedGame{

	public static final String gameName = "Bait";
	
	public static final int windowHeight = 600;
	
	public static final int windowWidth = 400;
	
	public static final int menuID = 0;
	
	public static final int playID = 1;
	
	public static final int gameOverID = 2;
	
	public SetupGame(String name) {
		super(name);
		addState(new Menu());
		addState(new Play());
		addState(new GameOver());
	}

	public static void main(String[] args) throws SlickException {
		AppGameContainer agc = new AppGameContainer(new SetupGame(gameName), windowWidth, windowHeight, false);
		agc.start();
	}

	@Override
	public void initStatesList(GameContainer gc) throws SlickException {
		getState(menuID).init(gc, this);
		getState(playID).init(gc, this);
		getState(gameOverID).init(gc, this);
		enterState(menuID);
	}

}
