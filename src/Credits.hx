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


class Credits extends Sprite{
	public static var assets:AssetManager;
	public var rootSprite:Sprite;
	public var credits:Image;
	private var textField:TextField; 
	private var textFormat:TextFormat;
	public function new(rootSprite:Sprite){
		this.rootSprite = rootSprite;
		super();
	}

	public function start(){
    				

		credits = new Image(Root.assets.getTexture("credits"));
		credits.x = 0;
		credits.y = 0;
		rootSprite.addChild(credits);

		//Set Textfield to be used as a terminal
		textField = new flash.text.TextField();
		textFormat = new TextFormat("Arial", 18, 0xffffff);
		textFormat.align = TextFormatAlign.LEFT;
		textField.defaultTextFormat = textFormat;
		//Accept the ability for input
		textField.type = TextFieldType.INPUT;
		textField.height = 25;
		textField.x = 36;
		textField.y = 478;
		//Set the background and width
		textField.background = true;
		textField.backgroundColor = 0x433C3C;
		textField.width = 700;
		Starling.current.nativeOverlay.addChild(textField);

		textField.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);

	}

	public function keyDown(event:KeyboardEvent ){
		var keyCode = event.keyCode;
		if(keyCode == 13){
			if(textField.text == "Play" || textField.text == "play"){
				removeChildren();
				var game = new Game(rootSprite);
				game.start();
			}
			else{
				trace("Nope");
			}
		}

	}
}