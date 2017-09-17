require_relative 'cascade'
require_relative 'free_cell'
require_relative 'foundation'
require_relative 'deck'

class Game
  FREECELL_INDICES = {'c1' => 0, 'c2' => 1, 'c3' => 2, 'c4' => 3}
  FOUNDATION_INDICES = {'f1' => 0, 'f2' => 1, 'f3' => 2, 'f4' => 3}
  CASCADE_INDICES = {'1' => 0, '2' => 1, '3' => 2, '4' => 3,
    '5' => 4, '6' => 5, '7' => 6, '8' => 7}

  attr_reader :deck, :cascades, :foundations, :freecells

  def initialize(deck = Deck.new)
    @deck = deck
    @cascades = Array.new(8) { Cascade.new }
    @foundations = Array.new(4) { Foundation.new }
    @freecells = Array.new(4) { FreeCell.new }

    populate_cascades
  end

  def won?
    @foundations.all? { |foundation| foundation.completed? }
  end

  def lost?

  end

  # moves a card from one CardHolder to another
  def move(source, destination)
    begin
      destination.append(source.pop)
    rescue Exception => e
      raise "invalid move"
    end
  end

  def play
    until won? || lost?
      render
      begin
        display_help_message
        src, dest = parse_move(acquire_move)
        move(src, dest)
      rescue StandardError => e
        Kernel.exit(0) if e.is_a?(SignalException)
        puts "error: #{e.message}. Try again."
      end
    end

    victory if won?
    defeat if lost?
  end

  private

  def populate_cascades
    i = 0
    until @deck.count == 0
      @cascades[i % 8].append(deck.deal_a_card, :dealing)
      i += 1
    end
  end

  def acquire_move
    print "Your move: "

    begin
      src_dest_pair = gets.chomp.split(',')
      raise "bad input" unless valid_input(src_dest_pair)
    rescue
      puts "Invalid move. Try again."
    end

    src_dest_pair
  end

  def parse_move(src_dest_pair)
    src_text, dest_text = src_dest_pair
    [container(src), container(dest)]
  end

  def container(str)
    case
    when FREECELL_INDICES.keys.include?(src_text)
      @freecells[FREECELL_INDICES[src_text]]
    when FOUNDATION_INDICES.keys.include?(src_text)
      @foundations[FOUNDATION_INDICES[src_text]]
    when CASCADE_INDICES.keys.include?(src_text)
      @cascades[CASCADE_INDICES[src_text]]
    end
  end

  def display_help_message
    puts "Enter source pile and destination pile, separated by a comma."
    puts "- Freecells are: c1, c2, c3, c4."
    puts "- Foundations are: f1, f2, f3, f4."
    puts "- Cascades are: 1, 2, 3, 4, 5, 6, 7, 8"
    puts "Exaple -- To move from cascade 1 to freeCell 1, use: 1,c1"
  end

  def valid_input?(arr)
    return false if arr[0] == arr[1]

    moves = FREECELL_INDICES.keys + FOUNDATION_INDICES.keys +
      CASCADE_INDICES.keys
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

    puts "\n"
    puts "freecells: #{freecells_str}"
    puts "\n\n"
    puts "foundations: #{foundations_str}"
    puts "\n\n"
    puts "cascades: #{cascades_str}"
    puts "\n\n"
  end

end
