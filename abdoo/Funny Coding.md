# Funny Coding
I will put here how I fixed some code problems

## Icon in Story Menu
- I didn't know how to get the icons (that shows on the corners of the Story Menu) 
 based on the players of the week, so I realized that the character's name are (most of the time)
 the same as their icon names. So I used that to do the thing, but for now idk how to split 
 the icon image in to 2

- To show the two icons, I first coded the thing in (duh), but it took like 10 lines of code.
I recreated the thing in a for loop (thx `i`), it's now like 4 lines (if u remove the *"beautifying"*
indentation and syntax i used). It is in `StoryMenuState.hx` (at the time I'm writing) around
line 194.

- Nvm, `HealthIcon.hx` can split the icon's sprite

## Blackout Event
- So basically it's an event where everything is dark (like a blackout duh) to make that,
we have a black FlxSprite called `overBg` that we add with an alpha of 0 over the stage 
but still under the characters, then we add another FlxSprite `overOver` which is above 
EVERYTHING. And based on the event's 2nd value, it either:
    - if value2 is `"on"` `"off"` then it's a switching event, so you have to manually
    turn the event on then off
    - if value2 is a float then we wait a timer that takes that float then fades away 
    the `overOver`
- The thing they both have in common is that once they're done with `overOver` they remove it
to gain performance (I love optimizing even tho idk how to)

- Agh, now it just keeps adding `overOver` and not removing it, probably
a problem in the if statements (there is only `if` and `else if`... no `else`)

- Ok so now, `overOver` has to remove itself when done with tweening it to alpha 0.
But the problem is that the tween starts, but the code goes on, I'm not in Python.
Python just goes through every single line, we're compiling here...!

- I'm always adding and removing `overOver`, why not add it at the very beginning
of any song, but knowing myself; It's not ***"optimizy"***.

## Change Stage Event
- I put that `switch` thing which sets the stage's sprites based on `curStage` inside 
a function `updateStage` so I can use that in the event.

- Took me 20 minutes to realize that I forgot to use `leStage` which is the argument of
the `updateStage` function instead of `curStage`. It's working now.

## Gloppy Cutscene
To test stuff *(a __**lot**__ of stuff)*, I put the song *"Jump Out"* from the *Bob & Bosip* mod.
So, because I wanted to test things out, I tried making an **"In-Game Cutscene"**.
I tried *manually* coding all the stuff *(making the camera go there and there)*, but the game 
would become crazy. So I looked at the `tankIntro` function which is the function
that starts each of Tankman's ( **IN-GAME** ) cutscenes. I noticed that it used something called
`CutsceneHandler`, idk what's that but it had pretty useful stuff like `onStart`, `finishCallback`,
`endTimer`... etc

So I coded a function called `glopCutsceneNEW` *(the old version was buggy)* at __line 1116__.

How does it start? In the `create` function there's a part where the game checks if we're in
story mode and if we haven't seen any cutscene yet *(I think it was made for video cutscenes)*,
and inside it was a switch statement to check the song's name.
So I copied that system but instead, the stuff that you put in that *new* switch statement
will happen even in freeplay. And that because in the **original** if-statement the game
checked if we we're in story mode:
```haxe
    if (isStoryMode && !seenCutscene)
``` 
But like I said, I made a new section but this time it was:
```haxe
    // We can Ignoer the storyMode checking, idk why i added that
    if ((!isStoryMode || isStoryMode) && !seenCutscene)
```

- **__Mind__**: *"Wait Abdoo, u know how the arrows fade in when the song is starting?"*
- **__Me__**: *"Uhhh... Yeah?"*
- **__Mind__**: *"Well, it's really 'un-funny', why not like put them INSTANTLY?"*

So then, I made the `generateStaticArrows` function which is the one that shows the arrows
*(it is used in `startCountdown`)*. So I added a new variable to the class called `fadeInArrows` 
that has `true` as value. And in that `generateStaticArrows` function, I added an if-statement
to make the arrows fade-in if `fadeInArrows = true`, or make them appear instantly if
`fadeInArrows = false`.

So I put that `glopCutsceneNEW` function in that ***"Freeplay Cutscene Section"***.
And so, when you play the song *"Jump Out"*, this - *cheap* - cutscene will play in both
story mode and freeplay.

## Credits Cool Zooming (not)
So, I wanted  the camera to \*bump\* if my credit is selected.
I first did that (`again` is originally `true`):
```haxe
    // update()
    while(creditsStuff[curSelected][1] == 'abdooowd' && again == true) {
		again = false;
		new FlxTimer().start(0.82, function(tmr){
			if (creditsStuff[curSelected][1] == 'abdooowd') // recheck so it doesnt bump for smn else
				bump(FlxG.camera, 'zoom', 1.2, 1, 0.4);
			again = true;
		});
	}
``` 
But it wasn't *optimizy*, so I did this instead:
```haxe
    // update()

    // Inspired from PlayState's camera zooming system
    FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, CoolUtil.boundTo(1 - (elapsed * 3.125), 0, 1));

	if (creditsStuff[curSelected][1] == 'abdooowd' && again) {
		again = false;
		FlxG.camera.zoom += 0.015;
		new FlxTimer().start(0.5, function(tmr){
			again = true;
		});
	}
```

