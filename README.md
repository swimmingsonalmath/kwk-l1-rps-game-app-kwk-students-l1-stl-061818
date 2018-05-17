# Creating Rock, Paper, Scissors

## Instructions

### Create the game model

Using `learn` or `rspec` to build the RPSGame model according to the tests.
This is a challenge that will require you to utilize all you've learned about
Object Oriented Ruby and Sinatra!

### Create the Sinatra app

Integrate your RPSGame class with the Sinatra application in app.rb.

The application will serve 1 route: GET requests to the path /rps/:play.
The value of :play will be used as the player's throw (rock, paper, or
scissors).

The Sinatra application should serve an HTML page that displays the move that
the player made, the move that the computer made, and whether the player won,
lost, or tied.

Hints:

* There is a custom error provided in the RPSGame model.  To invoke this, use
`raise PlayTypeError` in your initialize method, but _only if_ the move received
is invalid.

* It is possible to pass the first tests automatically... but you can actually
fail these tests later if you do not write the correct solution for raising an
error on invalid moves.

* To make this a playable game, [look
into](https://stackoverflow.com/questions/198460/how-to-get-a-random-number-in-ruby)
using `rand(3)` as a way to choose _the index of an array of moves_.  Remember
how to select a specific element from an array using its index?

* The only valid moves are "rock", "paper", and "scissors", and we need to refer
to these in multiple locations on our model.  Maybe we can use some sort of...
variable... at the _class level_ to store these?

* Read the specs to see exactly what they're testing if you get stuck.  There are
specific variables, like `@computer_play` that the spec is looking for.

* In order to call instance methods within _other_ methods of the same class, you
need to write `self.` before the method name.. so `self.tied?` for instance,
would allow you to call the method `tied` in some other method...

* The word `self` refers to a particular instance of a class, so it is sort of
like saying _'for this particular instance of RPSGame, call one of the instance
methods'_.  This allows us to build 'helper' methods - methods that do one job
and can be used in other methods to keep code organized and easy to follow. You
don't necessarily need this to pass the tests, but you will need it to continue
building a playable game.

### After the Tests

If you've passed all the tests, _CONGRATULATIONS!_ This was a tough one!
However... we're not quite finished.  The tests in this lab are in place to make
sure you've got a good set up.  To create a playable game, you will need to do
the following:

1. Start up `shotgun` and navigate to the provide IP address. Add '/rps/:play'
at the end and you should see our `rps_game.erb` file displaying "WELCOME TO
ROCK PAPER SCISSORS".

2. In `app.rb`, you will need to call `RPSGame.new()`, passing in the correct
_parameter_ from the dynamic URL. Assign this to a variable, like `@game`, so it
reads `@game = RPSGame.new(params[:play])`. If the parameter is incorrect or an
invalid move, you should see Sinatra displaying our custom PlayTypeError error
appear. If the parameter matches "rock", "paper" or "scissors", you will see
"WELCOME TO ROCK PAPER SCISSORS" again, which means that your initialize method
on RPSGame has accepted the parameter as valid.

3. `@game` contains the entire instance of the class RPSGame that you just
initialized, meaning it can access to any attributes you will let access.
You'll want to add an attribute for the winner, like `@winner`.. and **you'll
also need to write some logic in your initialize method that plays the game**.
You've got all the parts already built out, and you start the game with _your_
move as the player.  Write some code that uses the  `computer_play` method, as
well as the `won?` method.  Assign `@winner` to something to indicate who won
the game, like "player" or "computer".  

4. Back in `app.rb`, you'll be able to access `@winner` within your game
instance by creating an instance variable and assigning it to
`@game.instance_variable_get(:@winner)`. `@winner =
@game.instance_variable_get(:@winner)` will work fine, as the first variable is
an instance of the GameApp class within `app.rb`.  

5. You will now be able to write in `rps_game.erb` within your 'views' folder,
so add the instance variable `@winner` within ERB tags.

6. Refresh the page a few times.  If all is working, you should see the
resulting winner displayed on the page.

### Stretch Goals

+ Can you display what you and the computer both played, _as well as_ the winner?
+ Can you build a _best 2 out of 3_ version of the game?


<p data-visibility='hidden'>KWK-L1 ---</p>
