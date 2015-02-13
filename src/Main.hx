import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldType;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.text.TextFormatAlign;
import flash.events.*;
//import starling.events.KeyboardEvent;


class Main extends Sprite{
	public static var assets:AssetManager;
	public var rootSprite:Sprite;
	public var mainMenu:Image;
	private var textField:TextField; 
	private var textFormat:TextFormat;
	public function new(rootSprite:Sprite){
		this.rootSprite = rootSprite;
		super();
	}

	public function start(){
    				

		mainMenu = new Image(Root.assets.getTexture("mainMenu"));
		mainMenu.x = 0;
		mainMenu.y = 0;
		rootSprite.addChild(mainMenu);

		//Set Textfield to be used as a terminal
		textField = new flash.text.TextField();
		textFormat = new TextFormat("Arial", 18, 0xffffff);
		textFormat.align = TextFormatAlign.LEFT;
		textField.defaultTextFormat = textFormat;
		//Accept the ability for input
		textField.type = TextFieldType.INPUT;
		textField.height = 25;
		textField.x = 36;
		textField.y = 473;
		//Set the background and width
		textField.background = true;
		textField.backgroundColor = 0x433C3C;
		textField.width = 700;
		Starling.current.nativeOverlay.addChild(textField);
    	textField.stage.focus = textField;
		textField.addEventListener(KeyboardEvent.KEY_DOWN, menuKeyDown);

	}

		public function menuKeyDown(event:KeyboardEvent ){
			var keyCode = event.keyCode;
  			if(keyCode == 13){
  				if(textField.text == "Play" || textField.text == "play"){
  					removeChildren();
  					var game = new Game(rootSprite);
					game.start();
					textField.text = "";
  				}
  				else if(textField.text == "Credits" || textField.text == "credits"){
  					var credits = new Credits(rootSprite);
  					credits.start();
  					textField.text = "";
  				}
  				else{
  					textField.text = "";
  				}
  			}

		}


}