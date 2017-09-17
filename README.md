# FreeCell

* Rules:

Construction and layout

* Cards are dealt face-up into eight Cascades, four of which comprise seven cards and four of which comprise six.
* The top card of each Cascade begins a tableau.
* Tableaux must be built down by alternating colors.
* Foundations are built up by suit.

Moves
* Any cell card or top card of any cascade may be moved to build on a tableau, or moved to an empty cell, an empty cascade, or its foundation.
* Complete or partial tableaus may be moved to build on existing tableaus, or moved to empty cascades.

Victory
* The game is won after all cards are moved to their foundation piles.

Directions taken from https://en.wikipedia.org/wiki/FreeCell


  Class Inheritance Hierarchy

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
