%database
visited_state(integer,integer).
%predicates
state(integer,integer).
%clauses
state(2,0).
state(X,Y):- X &lt; 4,
not(visited_state(4,Y)),
assert(visited_state(X,Y)),
write(&quot;Fill the 4-Gallon Jug: (&quot;,X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;, 4,&quot;,&quot;,Y,&quot;)\n&quot;),
state(4,Y).
state(X,Y):- Y &lt; 3,
not(visited_state(X,3)),
assert(visited_state(X,Y)),
write(&quot;Fill the 3-Gallon Jug: (&quot;, X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;,
X,&quot;,&quot;,3,&quot;)\n&quot;),
state(X,3).
state(X,Y):- X &gt; 0,
not(visited_state(0,Y)),
assert(visited_state(X,Y)),
write(&quot;Empty the 4-Gallon jug on ground: (&quot;, X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;,
0,&quot;,&quot;,Y,&quot;)\n&quot;),
state(0,Y).
state(X,Y):- Y &gt; 0,
not(visited_state(X,0)),
assert(visited_state(X,0)),
write(&quot;Empty the 3-Gallon jug on ground: (&quot;, X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;,
X,&quot;,&quot;,0,&quot;)\n&quot;),
state(X,0).
state(X,Y):- X + Y &gt;= 4,
Y &gt; 0,
NEW_Y = Y - (4 - X),
not(visited_state(4,NEW_Y)),
assert(visited_state(X,Y)),
write(&quot;Pour water from 3-Gallon jug to 4-gallon until it is full:
(&quot;, X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;, 4,&quot;,&quot;,NEW_Y,&quot;)\n&quot;),
state(4,NEW_Y).

state(X,Y):- X + Y &gt;=3,
X &gt; 0,
NEW_X = X - (3 - Y),
not(visited_state(X,3)),
assert(visited_state(X,Y)),
write(&quot;Pour water from 4-Gallon jug to 3-gallon until it is full:
(&quot;, X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;, NEW_X,&quot;,&quot;,3,&quot;)\n&quot;),
state(NEW_X,3).
state(X,Y):- X + Y&gt;=4,
Y &gt; 0,
NEW_X = X + Y,
not(visited_state(NEW_X,0)),
assert(visited_state(X,Y)),
write(&quot;Pour all the water from 3-Gallon jug to 4-gallon: (&quot;,
X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;, NEW_X,&quot;,&quot;,0,&quot;)\n&quot;),
state(NEW_X,0).
state(X,Y):- X+Y &gt;=3,
X &gt; 0,
NEW_Y = X + Y,
not(visited_state(0,NEW_Y)),
assert(visited_state(X,Y)),
write(&quot;Pour all the water from 4-Gallon jug to 3-gallon: (&quot;,
X,&quot;,&quot;,Y,&quot;) --&gt; (&quot;, 0,&quot;,&quot;,NEW_Y,&quot;)\n&quot;),
state(0,NEW_Y).
state(0,2):- not(visited_state(2,0)),
assert(visited_state(0,2)),
write(&quot;Pour 2 gallons from 3-Gallon jug to 4-gallon: (&quot;,
0,&quot;,&quot;,2,&quot;) --&gt; (&quot;, 2,&quot;,&quot;,0,&quot;)\n&quot;),
state(2,0).
state(2,Y):- not(visited_state(0,Y)),
assert(visited_state(2,Y)),
write(&quot;Empty 2 gallons from 4-Gallon jug on the ground: (&quot;,
2,&quot;,&quot;,Y,&quot;) --&gt; (&quot;, 0,&quot;,&quot;,Y,&quot;)\n&quot;),
state(0,Y).
goal:-
makewindow(1,2,3,&quot;4-3 Water Jug Problem&quot;,0,0,25,80),
state(0,0).