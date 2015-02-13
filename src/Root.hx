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
    assets.enqueue("assets/bgmusic.mp3");
    assets.enqueue("assets/atlas.xml");
    assets.enqueue("assets/assets.png");
    

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
