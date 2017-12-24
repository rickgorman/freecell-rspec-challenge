# FreeCell Ruby/RSpec Coding Challenge

Like FreeCell? Want to improve your RSpec skills? This repo serves as a series of rspec tests that will guide you towards building a functional copy of FreeCell (CLI).

With 100+ hours experience in Ruby, this might take you 1-2 hours to complete.

## Getting Started

You'll need a working install of [ruby](https://www.ruby-lang.org/en/documentation/installation/).

* `gem install rspec`
* `git clone https://github.com/rickgorman/freecell.git`
* `cd freecell`
* `rspec spec` OR `rspec/<file>` (see file list below)

Your work cycle consists of working to pass a test (or two or five), then running rspec again. **When finished**, you can run the game via:
* `ruby game.rb`

## Recommended Completion Order

In passing the tests, moving through files in the following order is recommended:

1. card_spec.rb
2. deck_spec.rb
3. card_holder_spec.rb
4. free_cell_spec.rb
5. foundation_spec.rb
6. cascade_spec.rb
7. game_spec.rb


## FreeCell's Rules
* Cards are dealt face-up into eight Cascades, four of which comprise seven cards and four of which comprise six.
* The top card of each Cascade begins a tableau.
* Tableaux must be built down by alternating colors.
* Foundations are built up by suit.

## Moves
* Any cell card or top card of any cascade may be moved to build on a tableau, or moved to an empty cell, an empty cascade, or its foundation.
* Complete or partial tableaus may be moved to build on existing tableaus, or moved to empty cascades.

## Victory
* The game is won after all cards are moved to their foundation piles.

For further directions, see the [FreeCell wikipedia entry](https://en.wikipedia.org/wiki/FreeCell).

## Solution

If you get totally stuck, hop into the **solution/** folder and check out how I implemented my solution. To maximize your learning, it's probably best that you do this after being stuck on a test for at least 20 minutes.

## Class Inheritance Hierarchy

                        +------------+
                        | CardHolder |
                        +------------+
                              |
                 +------------+---------------+
                 |            |               |
         +----------+   +------------+   +---------+
         | FreeCell |   | Foundation |   | Cascade |
         +----------+   +------------+   +---------+           


         +--------+   +--------+   +------+
         |  Deck  |   |  Card  |   | Game |
         +--------+   +--------+   +------+

# License

[WTFPL](http://wtfpl.net)
