class Card

  attr_accessor :value, :suit

  NAMES = {2 => "Two",
           3 => "Three",
           4 => "Four",
           5 => "Five",
           6 => "Six",
           7 => "Seven",
           8 => "Eight",
           9 => "Nine",
           10 => "Ten",
           11 => "Jack",
           12 => "Queen",
           13 => "King",
           14 => "Ace"
         }

  def initialize(value, suit)
    raise Error unless value.between?(2,14)
    self.value = value
    self.suit = get_name(suit)
  end

  def get_name(suit)
    name = ""
    case suit
    when 0
      name = "Spades"
    when 1
      name = "Hearts"
    when 2
      name = "Clubs"
    when 3
      name = "Diamonds"
    end
    name
  end

  def to_s
    "#{NAMES[self.value]} of #{self.suit}"
  end

  def <=>(other_card)
    self.value <=> other_card.value
  end

end
