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
class Root extends Sprite {

  public static var assets:AssetManager;
  public var closeDoor:Image;
  public var window:Image;
  public var rootSprite:Sprite;

  public function new() {
  	rootSprite = this;
    super();
  }

  public function start(startup:Startup) {

    assets = new AssetManager();
    assets.enqueue("assets/close_door.png");
    assets.enqueue("assets/window.png");
    assets.enqueue("assets/brokenWindow.png");
    assets.enqueue("assets/mainMenu.png");
    assets.enqueue("assets/background1.png");
    assets.enqueue("assets/credits.png");
    assets.enqueue("assets/chair2.png");
    assets.enqueue("assets/computer.png");
    assets.enqueue("assets/brokenGlass.png");
    assets.enqueue("assets/avatarNormal.png");
    assets.enqueue("assets/avatarDead.png");
    assets.enqueue("assets/table.png");
    assets.enqueue("assets/bed.png");
    assets.enqueue("assets/cutBed.png");

    assets.loadQueue(function onProgress(ratio:Float) {
		if (ratio == 1) {
		// loading completed animation
		Starling.juggler.tween(startup.loadingBitmap, 2.0, {transition:Transitions.EASE_OUT, delay:0, alpha: 0, onComplete: function(){
			// cleaning up the loadingScreen after it has already faded	
			startup.removeChild(startup.loadingBitmap);
			var main = new Main(rootSprite);
			main.start();

			// closeDoor = new Image(Root.assets.getTexture("close_door"));
			// closeDoor.x = 200;
			// closeDoor.y = 200;
			// addChild(closeDoor);
		}});
	}
      });

  }

}
