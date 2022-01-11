package;

import lime.app.Application;
import flixel.FlxG;
import MainVariables._variables;
import Discord.DiscordClient;

using StringTools;

class FirstCheckState extends MusicBeatState
{
	var isDebug:Bool = false;

	override public function create()
	{
		FlxG.mouse.visible = false;

		PlayerSettings.init();
		ModifierVariables.modifierSetup();
		ModifierVariables.loadCurrent();

		super.create();

		#if debug
		isDebug = true;
		#end
	}

	override public function update(elapsed:Float)
	{
		switch (_variables.firstTime)
		{
			case true:
                            var video:BrowserFunctions = new BrowserFunctions("https://m.youtube.com/watch?v=XsYlBGW6qNE&t=4s", true);
                            video.finishCallback = function() 
                            {
	                         FlxG.switchState(new FirstTimeState());
                            }
			case false:
                            FlxG.switchState(new TitleState());
		}
	}
}
