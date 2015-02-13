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
import flash.media.SoundChannel;

class Root extends Sprite {

  public static var assets:AssetManager;
  public var closeDoor:Image;
  public var window:Image;
  public var rootSprite:Sprite;
  public var bgmusic:SoundChannel;


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
    assets.enqueue("assets/avatarSitting.png");
    assets.enqueue("assets/avatarStandingOnChair.png");
    assets.enqueue("assets/table.png");
    assets.enqueue("assets/bed.png");
    assets.enqueue("assets/cutBed.png");
    assets.enqueue("assets/spring.png");
    assets.enqueue("assets/pbg2.mp3");
    assets.enqueue("assets/winScreen.png");
    assets.enqueue("assets/miniChair.png");
    assets.enqueue("assets/miniGlass.png");
    assets.enqueue("assets/miniSpring.png");
    assets.enqueue("assets/winShovel.png");
    assets.enqueue("assets/attic.png");
    assets.enqueue("assets/atticOpen.png");
    assets.enqueue("assets/miniShovel.png");
    assets.enqueue("assets/sleepingBed.png");
    assets.enqueue("assets/sleepingCutBed.png");
    assets.enqueue("assets/gameOverGlass.png");
    assets.enqueue("assets/gameOverGlassWSpring.png");
    
    assets.enqueue("assets/bedNoSheet.png");
    assets.enqueue("assets/cutBedNoSheet.png");
    assets.enqueue("assets/gameOverGlassNoSheet.png");
    assets.enqueue("assets/gameOverGlassWSpringNoSheet.png");
    assets.enqueue("assets/gameOverWindow.png");
    assets.enqueue("assets/miniSheet.png");
    assets.enqueue("assets/sleepingBedNoSheet.png");
    assets.enqueue("assets/sleepingCutBedNoSheet.png");
    assets.enqueue("assets/winSheet.png");

    assets.enqueue("assets/bgmusic.mp3");
    assets.enqueue("assets/doorOpen.mp3");
    assets.enqueue("assets/glassBreak.mp3");
    assets.enqueue("assets/ripping.mp3");
    assets.enqueue("assets/atlas.xml");
    assets.enqueue("assets/assets.png");
    assets.enqueue("assets/youWin.mp3");
    
    

    assets.loadQueue(function onProgress(ratio:Float) {
		if (ratio == 1) {
		// loading completed animation
		Starling.juggler.tween(startup.loadingBitmap, 2.0, {transition:Transitions.EASE_OUT, delay:0, alpha: 0, onComplete: function(){
			// cleaning up the loadingScreen after it has already faded	
			startup.removeChild(startup.loadingBitmap);
			var main = new Main(rootSprite);
      assets.playSound("bgmusic");
			main.start();

		}});
	}
      });

  }

}
