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
	                    // First time language setting
                            //var video = new WebmPlayerS("assets/videos/paint.webm", true);
                            //video.endcallback = () -> {
                                  //remove(video);
                                  FlxG.switchState(new FirstTimeState());
                            //}
                            //video.setGraphicSize(FlxG.width);
                            //video.updateHitbox();
                            //add(video);
                            //video.play();
			case false:
                            FlxG.switchState(new TitleState());
		}
	}
}
