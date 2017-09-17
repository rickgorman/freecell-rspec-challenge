require_relative 'cascade'
require_relative 'free_cell'
require_relative 'foundation'
require_relative 'deck'

class Game
  attr_reader :deck, :cascades, :foundations, :freecells

  def initialize(deck = Deck.new.shuffle!)
  end

  def won?
  end

  def lost?
  end

  # moves a card from one CardHolder to another
  def move(source, destination)
  end

  def play
    until won? || lost?
      render
      begin
        display_help_message
        move(acquire_move)
      rescue StandardError => e
        puts "error: #{e.message}. Try again."
      end
    end

    victory if won?
    defeat if lost?
  end

  private

  def acquire_move
    print "Your move: "

    begin
      input = gets.chomp.split(',')
      raise "bad input" unless valid_input(input)
    rescue
      puts "Invalid move. Try again."
    end

    input
  end

  def display_help_message
    puts "Enter source pile and destination pile, separated by a comma."
    puts "- Freecells are: c1, c2, c3, c4."
    puts "- Foundations are: f1, f2, f3, f4."
    puts "- Cascades are: 1, 2, 3, 4, 5, 6, 7, 8"
    puts "Exaple -- To move from cascade 1 to freeCell 1, use: c1,1"
  end

  def valid_input?(arr)
    moves = %w(c1 c2 c3 c4 f1 f2 f3 f4 1 2 3 4 5 6 7 8)
    moves.include?(arr[0]) && moves.include?(arr[1])
  end

  def victory
    puts "You're a winner!"
  end

  def defeat
    puts "Have a participation trophy."
  end

  def render
    freecells_str = ""
    @freecells.each { |cell| freecells_str << "#{cell} " }

    foundations_str = ""
    @foundations.each { |foundation| foundations_str << "#{foundation}\n" }

    cascades_str = ""
    @cascades.each { |cascade| cascades_str << "#{cascade}\n" }

    puts "freecells: #{freecells_str}"
    puts "\n\n"
    puts "foundations: #{foundations_str}"
    puts "\n\n"
    puts "cascades: #{cascades_str}"
    puts "\n\n"
  end

end
