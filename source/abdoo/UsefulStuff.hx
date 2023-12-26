package abdoo;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class UsefulStuff {
    public static function bump(obj: Dynamic, property: String, from: Float, ?to: Float=1, ?duration:Float = 0.2) {
        Reflect.setProperty(obj, property, from);
        var values = { };
        Reflect.setProperty(values, property, to);
        FlxTween.tween(obj, values, duration, { ease: FlxEase.cubeOut });
    }
}