package abdoo;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import openfl.Assets;

/**
 * A class that has some *useful* stuff, like functions and variables...
 */
class UsefulStuff {
    
    /**
     * returns the mod version from 'modVersion.txt'.
     */
    public static function getModVersion(): String {
        return Assets.getText(Paths.txt('modVersion'));
    }

    /**
     * Makes `property` of `obj` bump from `from` to `to`.
     * @param obj The object/property that has the property to bump.
     * @param property The property to bump.
     * @param from Sets the property to this value.
     * @param to Tweens back to this value.
     * @param duration How much it takes to get back to `to`.
     */
    public static function bump(obj: Dynamic, property: String, from: Float, ?to: Float=1, ?duration:Float = 0.2):Void {
        Reflect.setProperty(obj, property, from);
        var values = { };
        Reflect.setProperty(values, property, to);
        FlxTween.tween(obj, values, duration, { ease: FlxEase.cubeOut });
    }
}