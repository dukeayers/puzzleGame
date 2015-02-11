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


class Game extends Sprite{
	public static var assets:AssetManager;
	public var rootSprite:Sprite;
	public var background:Image;
	public var chair:Image;
	private var textField:TextField; 
	private var textFormat:TextFormat;
	public function new(rootSprite:Sprite){
		this.rootSprite = rootSprite;
		super();
	}

	public function start(){
    				

		background = new Image(Root.assets.getTexture("background1"));
		background.x = 0;
		background.y = 0;
		rootSprite.addChild(background);
		chair = new Image(Root.assets.getTexture("chair2"));
		chair.x = 100;
		chair.y = 300;
		rootSprite.addChild(chair);

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
		if (keyCode == 13){
			// door statements, should be changed to do stuff later
			if(textField.text == "Door" || textField.text == "door"){
  				trace("You see a wooden door.");
  			}
  			if(textField.text == "Open door" || textField.text == "open door"){
  				trace("You try to open the door, but it is locked.");
  			}
  			if(textField.text == "Kick door" || textField.text == "kick door"){
  				trace("You kick the door, but it won't budge.");
  			}
  			if(textField.text == "Knock on door" || textField.text == "knock on door"){
  				trace("You knock on the door, but no one answers.");
  			}
  			if(textField.text == "Push door" || textField.text == "push door"){
  				trace("You push the door, but it doesn't budge.");
  			}
  			if(textField.text == "Pull door" || textField.text == "pull door"){
  				trace("You pull on the door, but it doesn't budge.");
  			}

  			// window statements, need to add interacitivity later
  			if(textField.text == "Open window" || textField.text == "open window"){
  				trace("You try to open the window, but it doesn't budge.");
  			}
  			if(textField.text == "Break window" || textField.text == "break window"){
  				trace("You have nothing to break the window with.");
  			}
  			if(textField.text == "Crawl out window" || textField.text == "crawl out window"){
  				trace("The window is shut, you cannot crawl out.");
  			}

  			// chair statements, needs interactivity
  			if(textField.text == "Sit on chair" || textField.text == "sit on chair"){
  				trace("You sit down on the chair.");
  			}
  			if(textField.text == "Pick up chair" || textField.text == "pick up chair"){
  				trace("You pick the chair up in your arms.");
  			}


  			// clear console text
  			textField.text = "";

		}

	}
}