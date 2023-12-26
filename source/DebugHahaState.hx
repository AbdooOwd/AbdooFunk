import flixel.FlxSprite;
import flixel.FlxG;
import abdoo.UsefulStuff as LeUse;


class DebugHahaState extends MusicBeatState {

    var bg: FlxSprite;

    override function create() {
        bg = new FlxSprite(0, 0).loadGraphic(Paths.image('menuDesat', 'preload'));
        bg.screenCenter(XY);
        add(bg);

        super.create();
    }

    override function update(elapsed) {
        if (controls.BACK) {
            MusicBeatState.switchState(new MainMenuState());
        }

        if (controls.ACCEPT) {
            LeUse.bump(FlxG.camera, "zoom", 1.5);
        }
        
        super.update(elapsed);
    }
}