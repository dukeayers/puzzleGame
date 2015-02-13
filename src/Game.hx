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

//This function is to set the focus on the textField, it does not work.
//public static setFocus(newFocus: Object) : Boolean

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
public var avatarSitting:Image;
public var avatarStandingOnChair:Image;
public var table:Image;
public var bed:Image;
public var cutBed:Image;
public var miniGlass:Image;
public var miniChair:Image;
public var miniSpring:Image;
public var bed2:Image;
public var spring:Image;
public var winScreen:Image;


private var textField:TextField; 
private var textFormat:TextFormat;
private var textOut:TextField;
private var textOutFormat:TextFormat;
private var quadBack:Quad;

public var holdingChair:Bool = false;
public var holdingGlass:Bool = false;
public var holdingSpring:Bool = false;
public var doorLocked:Bool = true;
public var userSitting:Bool = false;
public var userSleeping:Bool = false;
public var userStandingOnChair:Bool = false;

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
		chair.x = 700;
		chair.y = 300;
		rootSprite.addChild(chair);
		
		avatarStandingOnChair = new Image(Root.assets.getTexture("avatarStandingOnChair"));
		avatarStandingOnChair.x = 679;
		avatarStandingOnChair.y = 34;

		brokenWindow = new Image(Root.assets.getTexture("brokenWindow"));
		brokenWindow.x = 100;
		brokenWindow.y = 200;
		
		miniChair = new Image(Root.assets.getTexture("miniChair"));
                miniChair.x = 480;
                miniChair.y = 58;

                miniGlass = new Image(Root.assets.getTexture("miniGlass"));
                miniGlass.x = 530;
                miniGlass.y = 58;

                miniSpring = new Image(Root.assets.getTexture("miniSpring"));
                miniSpring.x = 580;
                miniSpring.y = 58;

   	table = new Image(Root.assets.getTexture("table"));
  	table.x = 800;
  	table.y = 350;
  	rootSprite.addChild(table);

		computer = new Image(Root.assets.getTexture("computer"));
		computer.x = 820;
		computer.y = 265;
  	computer.scaleX *= 0.5;
  	computer.scaleY *= 0.5;
		rootSprite.addChild(computer);

		brokenGlass = new Image(Root.assets.getTexture("brokenGlass"));
		brokenGlass.x = -100;
		brokenGlass.y = 250;


    	cutBed = new Image(Root.assets.getTexture("cutBed"));
    	cutBed.x = 150;
    	cutBed.y = 145;

      bed2 = new Image(Root.assets.getTexture("bed"));
      bed2.x = 150;
      bed2.y = 145;
      rootSprite.addChild(bed2);

    	spring = new Image(Root.assets.getTexture("spring"));
    	spring.x = 335;
    	spring.y = 375;

    	avatarSitting = new Image(Root.assets.getTexture("avatarSitting"));
    	avatarSitting.x = 675;
    	avatarSitting.y = 175;


    	avatar = new Image(Root.assets.getTexture("avatarNormal"));
    	avatar.x = 575;
    	avatar.y = 220;
    	rootSprite.addChild(avatar);

      winScreen = new Image(Root.assets.getTexture("winScreen"));
      winScreen.x = 0;
      winScreen.y = 0;


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

        //Trying to set the focus... again.
        //Starling.setFocus("textField");

        //This is for outputting text
        textOut = new flash.text.TextField();
        textOutFormat = new TextFormat("Arial", 18, 0xffffff);
        textOutFormat.align = TextFormatAlign.LEFT;
        textOut.defaultTextFormat = textOutFormat;
        textOut.background = true;
        textOut.backgroundColor = 0x50826e;
        textOut.width = 700;
        textOut.x = 0;
        textOut.y = 520;
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
  		if(textField.text == "Open door" || textField.text == "open door" || textField.text == "open the door"){
  			if(userSitting == true){
  				//trace("you cant do that because you are sitting");
                textOut.text = "You can't do that because you are sitting";
                trace(textOut.text);
  			}
  			else{
  				if(doorLocked == true){
  					trace("You try to open the door, but it seems to be locked.");
  			}
  				else{
  					trace("The door opens, YOU WIN!!!");
  					// win the game, win screen here
                    rootSprite.addChild(winScreen);
                    if (textField.text == "Play" || textField.text == "play")
                    {
                            removeChildren();
                            removeEventListeners();
                            start();
                    }
  				}	
  			}
  			
  		}
  		if(textField.text == "Kick door" || textField.text == "kick door" || textField.text == "kick in door" || textField.text == "kick down door" 
  			|| textField.text == "kick the door"){
  			trace("You kick the door, but it won't budge.");
		}
 		if(textField.text == "Knock on door" || textField.text == "knock on door" || textField.text == "knock on the door"){
  			trace("You knock on the door, but no one answers.");
  		}
  		if(textField.text == "Push door" || textField.text == "push door" || textField.text == "push on the door" || textField.text == "push the door"){
  			if(userSitting == true){
  				trace("You cannot do that because you are sitting.");
  			}
  			else{
  				if(doorLocked == true){
  					trace("You try to push the door, but it seems to be locked.");
  				}
  				else{
  					trace("The door opens, YOU WIN!!!");
  					// win the game, win screen here
                    rootSprite.addChild(winScreen);
                    if (textField.text == "Play" || textField.text == "play")
                    {
                            removeChildren();
                            removeEventListeners();
                            start();
                    }
  				}
  			}
  		}


  		if(textField.text == "Pull door" || textField.text == "pull door" || textField.text == "pull on the door" || textField.text == "pull the door"){
  			if(userSitting == true){
  				trace("You cant do that because you are sitting still.");
  			}
  			else{
  				if(doorLocked == true){
  					trace("You try to pull the door, but it seems to be locked.");
  			}
  				else{
  					trace("The door opens, YOU WIN!!!");
  					// win the game, win screen here
                    rootSprite.addChild(winScreen);
                    if (textField.text == "Play" || textField.text == "play")
                    {
                            removeChildren();
                            removeEventListeners();
                            start();
                    }
  				}
  			}
  		}
  		if(textField.text == "Pick door" || textField.text == "pick door" || textField.text == "unlock door" 
  			|| textField.text == "pick door lock" || textField.text == "pick lock"){
  			if(userSitting == true){
  				trace("You cannot do that, you are still sitting.");
  			}
  			else{
  				if(doorLocked == true){
  					if(holdingSpring == true){
  						trace("You pick the door lock with the spring. The door unlocks.");
  						doorLocked = false;
  					}
  					else{
  						trace("You have nothing to pick the door's lock with.");
  					}
  				}
  				else{
  					trace("the door is already unlocked");
  				}	
  			}
  		}


  		// window statements, need to add interacitivity later
  		if(textField.text == "Window" || textField.text == "window"){
  			trace("You see a window.");
  		}
  		if(textField.text == "Open window" || textField.text == "open window" || textField.text == "open the window"){
  			if(userSitting == true){
  				trace("you cant, you are sitting still");
  			}
  			else{
  				trace("you try to open the window, but it doensn't budge.");
  			}
  		}

  		if(textField.text == "Break window" || textField.text == "break window" || textField.text == "punch window"|| textField.text == "hit window with chair"|| 
  			textField.text == "smash window" || textField.text == "break the window"){


  			if(userSitting == true){
  				trace("you cant do that you are sitting.");

  			}
  			else{
  				if(holdingChair == false){
  					trace("You have nothing to break the window with.");
  				}
  				else{
  					trace("You break the window with the chair.");
  					rootSprite.removeChild(window);
  					rootSprite.addChild(brokenWindow);
  					rootSprite.addChild(brokenGlass);
  				}
  			}
  		}

  		if(textField.text == "Crawl out window" || textField.text == "crawl out window" || textField.text == "go out window" || textField.text == "escape through window"){
  			trace("The window is shut, you cannot crawl out.");
  			}


  		//glass statements
  		if(textField.text == "Pick up glass" || textField.text == "pick up glass" || textField.text == "get glass" || textField.text == "pickup broken glass"
  		 || textField.text == "pick up broken glass"){
  		 	if(userSitting == true){
  		 		trace("you cant, you are still sitting");
  		 	}
  		 	else{
  		 		if(holdingGlass == true){
  					trace("You already picked the glass up.");
  			}
  				else{
  					trace("You pick up the broken glass.");
  					playerInventory.add("Broken Glass");
					rootSprite.addChild(miniGlass);
  					rootSprite.removeChild(brokenGlass);
  					holdingGlass = true;
  				}
  		 	}
  		}
  			if(textField.text == "Put down glass" || textField.text == "put down glass" || textField.text == "drop glass" || textField.text == "drop broken glass" 
  				|| textField.text == "get rid of glass"){
  				if(userSitting == true){
  					trace("you cant, you are still sitting");
  				}
  				else{
  					if(holdingGlass == true){
  						trace("You put the broken glass back down on the floor.");
  						playerInventory.remove("Broken Glass");
						rootSprite.removeChild(miniGlass);
  						holdingGlass = false;
  						rootSprite.addChild(brokenGlass);
  					}
  					else{
  						trace("You did not pick up the glass.");
  					}
  				}
  			}	

        	if(textField.text == "Cut bed" || textField.text == "cut bed" || textField.text == "cut bed with glass" || textField.text == "cut open bed" 
        		|| textField.text == "cut mattress open" || textField.text == "cut mattress"){
        		if(userSitting == true){
        			trace("cant, still sitting");
        		}
        		else{
        			if(holdingGlass == true){
            			trace("You cut open the bed with the broken glass.");
            			rootSprite.removeChild(bed);
            			rootSprite.addChild(cutBed);
            			rootSprite.addChild(spring);
          			}
          			else{
          				trace("you have nothing to cut the bed with");
          			}
        		}
        	}


  			// chair statements, needs interactivity
			if(textField.text == "Stand on chair" || textField.text == "stand on chair" || textField.text == "Stand on the chair" || textField.text == "stand on the chair"){
				if(userStandingOnChair == true){
  					trace("you are already standing on the chair");
  				}
  				else{
  					if(holdingChair == true){
  						trace("there is no chair to stand on.");
  					}
  					else{
  						trace("you stood on the chair");
  						userStandingOnChair = true;
  						rootSprite.removeChild(avatar);
  						rootSprite.removeChild(chair);
  						rootSprite.addChild(avatarStandingOnChair);
  					}
  				}
			}
			
			if(textField.text == "get off chair" || textField.text == "Get off chair" || textField.text == "get down" || textField.text == "Get down" || textField.text == "step down" || textField.text == "Step down"){
  				if(userStandingOnChair == true){
  					userStandingOnChair = false;
  					trace("you got off the chair");
  					rootSprite.removeChild(avatarStandingOnChair);
  					rootSprite.addChild(avatar);
  					rootSprite.addChild(chair);
  				}
  			}
			
  			if(textField.text == "Sit on chair" || textField.text == "sit on chair" || textField.text == "sit"){
  				if(userSitting == true){
  					trace("you are already sitting in the chair");
  				}
  				else{
  					if(holdingChair == true){
  						trace("there is no chair to sit down on.");
  					}
  					else{
  						trace("you sit down on the chair");
  						userSitting = true;
  						rootSprite.removeChild(avatar);
  						rootSprite.removeChild(chair);
  						rootSprite.addChild(avatarSitting);
  					}
  				}
  			}
  			if(textField.text == "Stand up" || textField.text == "stand up" || textField.text == "stand"|| textField.text == "get up" ){
  				if(userSitting == true){
  					userSitting = false;
  					trace("you stand up");
  					rootSprite.removeChild(avatarSitting);
  					rootSprite.addChild(avatar);
  					rootSprite.addChild(chair);
  				}
  				else{
  					trace("you are already standing");
  				}
  			}

			
			
			
  			if(textField.text == "Pick up chair" || textField.text == "pick up chair" || textField.text == "grab chair" || textField.text == "pick up the chair"){
  				// check to see if player is already holding the chair
  				if(userSitting == true){
  					trace("you are sitting in the chair");
  				}
  				else{
  					if(holdingChair == true){
  						trace("You are already holding the chair.");
  					}
  					else{
  						trace("You pick up the chair.");
  						playerInventory.add("Chair");
						rootSprite.addChild(miniChair);
  						rootSprite.removeChild(chair);
  						holdingChair = true;
  					}	
  				}	
  			}

  			if(textField.text == "Put down chair" || textField.text == "put down chair" || textField.text == "set down chair" || textField.text == "drop chair" 
  				|| textField.text == "get rid of chair"){
  				if(holdingChair == true){
  					trace("You set the chair down.");
  					rootSprite.addChild(chair);
  					playerInventory.remove("Chair");
					rootSprite.removeChild(miniChair);
  					holdingChair = false;
  				}
  				else{
  					trace("You are not holding the chair.");
  				}
  			}


  			// bed statements
  			if(textField.text == "pick up spring" || textField.text == "get spring" || textField.text == "grab spring"){
  				if(holdingSpring == true){
  					trace("you already are holding spring");
  				}
  				else{
  					trace("you pickup a spring");
  					playerInventory.add("Spring");
					rootSprite.addChild(miniSpring);
  					rootSprite.removeChild(spring);
  					holdingSpring = true;
  				}
  				trace("You sit down on the chair.");
  			}

  			//computer statements
  			if(textField.text =="use computer"){
  				if(userSitting == true){
  					trace("You turn on the computer...");
  					// go to computer terminal screen here
  				}
  				else{
  					trace("you cant use the computer while standing");
  				}
  			}

  			// clear console text
  			textField.text = "";

            // TODO Set focus to textField
            //stage.focus = textField;
            //textField.setSelection(textField.text.length, textField.text.length);

  			trace("Inventory: " + playerInventory);
		}
	}
}
