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