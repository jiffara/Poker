class Deck

  attr_accessor :cards

  def initialize
    self.cards = Array.new(52)
    populate
  end

  def populate
    (0...52).each do |num|
      val = (num % 13) + 2
      suit = num % 4
      cards[num] = Card.new(val, suit)
    end
    cards.shuffle!
  end

  def shuffle
    populate
  end

  def deal(num_cards)
    final = []
    num_cards.times { final << cards.pop }
    final
  end

  def to_s
    string = ""
    cards.each do |card|
      string << "#{card}\n"
    end
    string
  end

end
