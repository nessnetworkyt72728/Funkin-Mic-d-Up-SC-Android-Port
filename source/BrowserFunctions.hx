#if mobile //This Supports IOS Too
package;

import flixel.FlxState;
import flixel.FlxBasic;
import extension.webview.WebView;

using StringTools;

class BrowserFunctions extends FlxBasic {
        public var finishCallback:Void->Void = null;

	public function new(path:String, isWebPage:Bool = false) {

        WebView.onClose = onClose;
	WebView.onURLChanging= onURLChanging;

        if (!isWebPage)
        {
                WebView.open('file:///android_asset/' + path + '.html', false, null, ['http://exitme(.*)']);
        }
        else
        {
                WebView.open(path, false, null, ['http://exitme(.*)']);
        }

		super();
	}

	public override function update(elapsed:Float) {
		for (touch in flixel.FlxG.touches.list)
			if (touch.justReleased)
				onClose();

		super.update(elapsed);	
	}

	function onClose() {
        if (finishCallback != null)
			finishCallback();
	}

	function onURLChanging(url:String) {
		if (url == 'http://exitme/') 
            onClose(); // drity hack lol
	}
}
#end
