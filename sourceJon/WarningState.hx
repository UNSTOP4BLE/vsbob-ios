package;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;


class WarningState extends MusicBeatState
{
	var music:FlxSound;
	var wentout:Bool = false;
	override function create()
	{
		super.create();
		FlxG.sound.music.fadeIn(0.5, 0.7, 0.1);
		var thx:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('WARNINGSCRENWARNINGSCREN', 'preload'));
		add(thx);
	}

	override function update(elapsed:Float)
	{ 
		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		if ((controls.ACCEPT || pressedEnter) && !wentout)
		{
			wentout = true;
			FlxG.sound.music.fadeIn(0.5, 0.1, 0.7);
			FlxG.switchState(new ThankYouState());
		}
		super.update(elapsed);
	}
	
}