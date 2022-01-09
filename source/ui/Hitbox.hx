package ui;

import flixel.graphics.FlxGraphic;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Hitbox extends FlxSpriteGroup
{
    public var hitbox:FlxSpriteGroup;

    var sizex:Int = 320;

    var screensizey:Int = 720;

    var frameshb:FlxAtlasFrames;

    public var K1:FlxButton;
    public var K2:FlxButton;
    public var K3:FlxButton;
    public var K4:FlxButton;
    public var K5:FlxButton;
    
    public function new(type:HitboxType = DEFAULT)
    {
        super();

        hitbox = new FlxSpriteGroup();
        hitbox.scrollFactor.set();
        
        var hitbox_hint:FlxSprite = new FlxSprite(0, 0);
        hitbox_hint.alpha = 0.3;
        add(hitbox_hint);

        // stupid way to fix crash
        K1 = new FlxButton(0, 0);
        K2 = new FlxButton(0, 0);
        K3 = new FlxButton(0, 0);
        K4 = new FlxButton(0, 0);
        K5 = new FlxButton(0, 0);

        switch (type)
        {
            case FIVE:
            {
                hitbox_hint.loadGraphic(Paths.image('hitbox/hitboxfive_hint', 'shared'));

                frameshb = Paths.getSparrowAtlas('hitbox/hitboxfive', 'shared');
                sizex = 256;

                hitbox.add(add(K1 = createhitbox(0, "K1"))); 
                hitbox.add(add(K2 = createhitbox(sizex, "K2")));
                hitbox.add(add(K5 = createhitbox(sizex * 2, "K5"))); 
                hitbox.add(add(K3 = createhitbox(sizex * 3, "K3")));    
                hitbox.add(add(K4 = createhitbox(sizex * 4, "K4")));
            }
            case DEFAULT:
            {
                hitbox_hint.loadGraphic(Paths.image('hitbox/hitbox_hint', 'shared'));

                frameshb = Paths.getSparrowAtlas('hitbox/hitbox', 'shared');
                sizex = 320;

                hitbox.add(add(K1 = createhitbox(0, "left")));
                hitbox.add(add(K2 = createhitbox(sizex, "down")));
                hitbox.add(add(K3 = createhitbox(sizex * 2, "up")));
                hitbox.add(add(K4 = createhitbox(sizex * 3, "right"))); 
            }
        }
    }

    public function createhitbox(X:Float, framestring:String) 
    {
        var button = new FlxButton(X, 0);      
        var graphic:FlxGraphic = FlxGraphic.fromFrame(frameshb.getByName(framestring));

        button.loadGraphic(graphic);
        button.alpha = 0;
    
        button.onDown.callback = function ()
        {
            FlxTween.num(0, 0.75, .075, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        };

        button.onUp.callback = function ()
        {
            FlxTween.num(0.75, 0, .1, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }
        
        button.onOut.callback = function ()
        {
            FlxTween.num(button.alpha, 0, .2, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }

        return button;
    }

    override public function destroy():Void
    {
        super.destroy();

        K1 = null;
        K2 = null;
        K3 = null;
        K4 = null;
        K5 = null;
    }
}

enum HitboxType 
{
    DEFAULT;
    FIVE;
}
