# The Monty Hall Problem

Suppose you're on a game show, and you're given the choice of three doors:
Behind one door is a car; behind the others, goats.
You pick a door, say No. 1, and the host, who knows what's behind the doors,
opens another door, say No. 3, which has a goat. He then says to you,
"Do you want to pick door No. 2?" Is it to your advantage to switch your choice?

The answer can be found and proven mathematically, but it can also be tested empirically
with simulations! The scripts in this repository do just that.

## The Logic

When making the initial choice, you have a 1 in 3 chance of choosing the car. Therefore, staying with your initial choice will win 1 out of 3 times. After the host reveals one of the goats, you have gained new information: you know where one of the goats are. The remaining goat is behind one door, and the car is behind the other.

It doesn't seem logical that switching doors would benefit you. No matter what you pick in the beginning, the host will always reveal a goat, so why should switching matter? To see why it does, consider when switching would benefit you: when you picked a goat initially. It would not benefit you if you picked the car initially. Which scenario is more likely? The former, since there are twice as many goats as cars to pick from.

Another way to think about it is that the importance of the opened door isn't that there's a goat, but that we know *where* the goat is. With only two doors left, we now know which door to switch *to*. Switching takes advantage of the information given by revealing one of the goat's locations.
