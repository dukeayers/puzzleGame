import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Quad;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldType;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.text.TextFormatAlign;
import flash.events.*;

//These imports are for setting the textField focus
//import flash.text.Stage;
//import starling.display.*;
//import starling.stage.*;

//import starling.events.KeyboardEvent;


class Game extends Sprite{

	public static var assets:AssetManager;
	public var rootSprite:Sprite;

	public var background:Image;
	public var chair:Image;
	public var window:Image;
	public var brokenWindow:Image;
	public var unopenDoor:Image;
	public var computer:Image;
	public var brokenGlass:Image;
    public var avatar:Image;
    public var table:Image;

	private var textField:TextField; 
	private var textFormat:TextFormat;
	private var quadBack:Quad;

	public var holdingChair:Bool = false;

	public var playerInventory = new List<String>();

	

	public function new(rootSprite:Sprite){
		this.rootSprite = rootSprite;
		super();
	}

	public function start(){
    				
		quadBack = new Quad(960, 480, 0x433C3C, true);
		quadBack.x = 0;
		quadBack.y = 0;
		rootSprite.addChild(quadBack);
		
		quadBack = new Quad(960, 180, 0x50826e, true);
		quadBack.x = 0;
		quadBack.y = 380;
		rootSprite.addChild(quadBack);
		
		quadBack = new Quad(960, 100, 0xfdffef, true);
		quadBack.x = 0;
		quadBack.y = 0;
		rootSprite.addChild(quadBack);

		window = new Image(Root.assets.getTexture("window"));
		window.x = 100;
		window.y = 200;
		rootSprite.addChild(window);

		unopenDoor = new Image(Root.assets.getTexture("close_door"));
		unopenDoor.x = 500;
		unopenDoor.y = 230;
		rootSprite.addChild(unopenDoor);

		chair = new Image(Root.assets.getTexture("chair2"));
		chair.x = 200;
		chair.y = 300;
		rootSprite.addChild(chair);

		brokenWindow = new Image(Root.assets.getTexture("brokenWindow"));
		brokenWindow.x = 100;
		brokenWindow.y = 200;

        table = new Image(Root.assets.getTexture("table"));
        table.x = 650;
        table.y = 310;
        rootSprite.addChild(table);

		computer = new Image(Root.assets.getTexture("computer"));
		computer.x = 680;
		computer.y = 225;
        computer.scaleX *= 0.5;
        computer.scaleY *= 0.5;
		rootSprite.addChild(computer);

        

		brokenGlass = new Image(Root.assets.getTexture("brokenGlass"));
		brokenGlass.x = 0;
		brokenGlass.y = 250;

        avatar = new Image(Root.assets.getTexture("avatarNormal"));
        avatar.x = 350;
        avatar.y = 210;
        rootSprite.addChild(avatar);


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
		textField.backgroundColor = 0x50826e;
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
  				// check to see if player is holding chair to break window with
  				if(holdingChair == false){
  					trace("You have nothing to break the window with.");
  				}
  				else{
  					trace("You break the window with the chair.");
  					rootSprite.addChild(brokenWindow);
  					rootSprite.addChild(brokenGlass);

  				}
  				  			}
  			if(textField.text == "Crawl out window" || textField.text == "crawl out window"){
  				trace("The window is shut, you cannot crawl out.");
  			}

  			// chair statements, needs interactivity
  			if(textField.text == "Sit on chair" || textField.text == "sit on chair"){
  				trace("You sit down on the chair.");
  			}
  			if(textField.text == "Pick up chair" || textField.text == "pick up chair"){
  				// check to see if player is already holding the chair
  				if(holdingChair == true){
  					trace("You are already holding the chair.");
  				}
  				else{
  					trace("You pick the chair up in your arms.");
  					playerInventory.add("chair");
  					rootSprite.removeChild(chair);
  					holdingChair = true;
  				}
  			}
  			if(textField.text == "Put down chair" || textField.text == "put down chair"){
  				if(holdingChair == true){
  					trace("You set the chair down.");
  					rootSprite.addChild(chair);
  					playerInventory.remove("chair");
  					holdingChair = false;
  				}
  				else{
  					trace("You are not holding the chair.");
  				}
  			}



  			// clear console text
  			textField.text = "";

            // TODO Set focus to textField
            //stage.focus = textField;
            //textField.setSelection(textField.text.length, textField.text.length);

  			trace("Inventory: "+ playerInventory);

		}

	}
}
