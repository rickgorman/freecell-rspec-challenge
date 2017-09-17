require_relative 'cascade'
require_relative 'free_cell'
require_relative 'foundation'
require_relative 'deck'

class Game
  FREECELL_INDICES = {'e1' => 0, 'e2' => 1, 'e3' => 2, 'e4' => 3}
  FOUNDATION_INDICES = {'f1' => 0, 'f2' => 1, 'f3' => 2, 'f4' => 3}
  CASCADE_INDICES = {'1' => 0, '2' => 1, '3' => 2, '4' => 3,
    '5' => 4, '6' => 5, '7' => 6, '8' => 7}

  attr_reader :deck, :cascades, :foundations, :freecells

  def initialize(deck = Deck.new)
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
        src, dest = parse_move(acquire_move)
        move(src, dest)
      rescue StandardError => e
        puts "error: #{e.message}"
      end
    end

    victory if won?
    defeat if lost?
  end

  private

  # potential helper method
  def populate_cascades
  end

  def acquire_move
    print "Your move: "

    begin
      src_dest_pair = gets.chomp.split(' ')
      raise "invalid input" unless valid_input?(src_dest_pair)
    rescue Exception => e
      if e.is_a?(SignalException)
        Kernel.exit(0)
      end
      puts "Invalid move. Try again. error: #{e.message}"
      retry
    end

    src_dest_pair
  end

  def parse_move(src_dest_pair)
    src_text, dest_text = src_dest_pair
    [container(src_text), container(dest_text)]
  end

  def container(str)
    case
    when FREECELL_INDICES.keys.include?(str)
      @freecells[FREECELL_INDICES[str]]
    when FOUNDATION_INDICES.keys.include?(str)
      @foundations[FOUNDATION_INDICES[str]]
    when CASCADE_INDICES.keys.include?(str)
      @cascades[CASCADE_INDICES[str]]
    end
  end

  def display_help_message
    puts "ENTER YOUR MOVE:"
    puts "  Instruction:"
    puts "  Enter source pile and destination pile, separated by a space."
    puts "  Example -- To move from cascade 1 to freeCell 1, use: [1 e1]"
  end

  def valid_input?(arr)
    return false if arr[0] == arr[1]

    moves = FREECELL_INDICES.keys + FOUNDATION_INDICES.keys +
      CASCADE_INDICES.keys
    moves.include?(arr[0]) && moves.include?(arr[1])
  end

  def victory
    render
    puts "You're a winner!"
  end

  def defeat
    puts "Have a participation trophy."
  end

  def render
    system("clear")
    freecells_str = "e1\te2\te3\te4\n\n"
    freecells_str += "\t\t"
    @freecells.each { |cell| freecells_str << "#{cell}\t" }

    foundations_str = ""
    foundation_prefixes = %w(f1 f2 f3 f4)
    @foundations.each do |foundation|
      foundations_str += "#{foundation_prefixes.shift}:\t\t"
      foundations_str << "#{foundation}\n"
    end

    cascades_str = "1\t2\t3\t4\t5\t6\t7\t8\t\n\n"
    cascade_matrix = []
    longest_cascade = 0
    @cascades.each do |cascade|
      len = cascade.pile.length
      longest_cascade = len if len > longest_cascade
      cascade_matrix << cascade.pile
    end

    (0...longest_cascade).each do |col|
      (0...8).each do |row|
        card = cascade_matrix[row][col]
        if card.nil?
          cascades_str << "\t"
        else
          cascades_str << "#{card}\t"
        end
      end

      cascades_str << "\n"
    end

    puts "\n"
    puts "FREECELLS:\t#{freecells_str}"
    puts "\n\n"
    puts "FOUNDATIONS:\n#{foundations_str}"
    puts "\n\n"
    puts "CASCADES: \n#{cascades_str}"
    puts "\n\n"
  end

end

if __FILE__ == $PROGRAM_NAME

  Game.new.play

end
