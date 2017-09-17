### card.rb -- sourced from Practice Assessment #2 (BlackJack)
require 'colorize'

# -*- coding: utf-8 -*-

# Represents a playing card.
class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :ace   => "A",
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K"
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    unless Card.suits.include?(suit) and Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})"
    end

    @suit, @value = suit, value
  end

  def color
  end

  def ranking
  end

  # is it legal to put this card under the other_card ala FreeCell rules?
  def goes_under?(other_card)
  end

  # Compares two cards to see if they're equal in suit & value.
  def ==(other_card)
    return false if other_card.nil?

    [:suit, :value].all? do |attr|
      self.send(attr) == other_card.send(attr)
    end
  end

  def to_s
    value == :ace ? text_color = :yellow : text_color = :white
    color == :black ? bg_color = :light_black : bg_color = :red

    "#{VALUE_STRINGS[value]} #{SUIT_STRINGS[suit]}"
      .colorize(:color => text_color, :background => bg_color)
  end
end
