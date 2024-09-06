/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR cc = 0
LIST name = c, r, a, i, g
LIST alphabet = a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
VAR l1 = ""
VAR l2 = ""
VAR l3 = ""
VAR l4 = ""
VAR l5 = ""
VAR counter = 1

-> name_entry

== name_entry ==
{counter == 6 : welcome, {name(1)}{name(2)}{name(3)}{name(4)}{name(5)}. -> cave_mouth}
Please enter your name.
~l1 = alphabet(RANDOM(1, 26))
~l2 = alphabet(RANDOM(1, 26))
~l3 = alphabet(RANDOM(1, 26))
~l4 = alphabet(RANDOM(1, 26))
~l5 = alphabet(RANDOM(1, 26))
+ [-{l1}]
~ name += l1
~counter++
-> name_entry
+ [-{l2}]
~ name += l2
~counter++
-> name_entry
+ [-{l3}]
~ name += l3
~counter++
-> name_entry
+ [-{l4}]
~ name += l4
~counter++
-> name_entry
+ [-{l5}]
~ name += l5
~counter++
-> name_entry


== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. it is very bright.
* {torch_pickup} [Light Torch] -> too_bright
+ [Keep going west] -> troll_cave
+ [Go Back] -> cave_mouth
-> END

== troll_cave ==
{not bribed and not fire : A troll guards the way.} {not bribed : {cc > 0 : It will let you pass for 100 coins. You have {cc} coins. | It won't let you pass until you come back with something valuable.}}
{fire : You are in a cave. The troll is knocked out on the floor.}
+ [Go back] -> west_tunnel
* {cc >= 100 and not fire} [Bribe troll] -> bribed
* {cc > 0 && cc < 100 and not bribed} [Light Torch] -> fire

== fire ==
You use your torch to light the troll on fire. It doesn't work very well, but the troll is so freaked out that it runs into a wall and knocks itself out. -> troll_cave

== bribed ==
The troll steps aside and lets you continue. -> troll_cave

=== torch_pickup ===
You now have a torch. May it light the way.
-> cave_mouth

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.

* [Take coins] -> take_coins
+ [Go Back] -> cave_mouth

== take_coins ==
You take 100 coins, which is as much as you can fit in your pockets. Upon further inspection, the coins are all chocolate.
~ cc = 100

-> gluttony

== gluttony ==
+ {cc > 0} [Eat a coin] -> eat_coin
+ [Go Back] -> east_tunnel_lit

== eat_coin ==
~ cc--
You eat a coin. You have {cc} coins left.

-> gluttony


== too_bright ==
You light up your torch. The excess light is too much for your body to handle, and you burn up until there is nothing but ash.
-> END