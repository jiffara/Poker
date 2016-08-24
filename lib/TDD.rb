class Array

  def my_uniq
    results = []
    self.each { |el| results << el unless results.include?(el) }
    results
  end

  def two_sum
    results = []
    (0...self.length).each do |i|
      ((i + 1)...self.length).each do |j|
        results << [i, j] if self[i] + self[j] == 0
      end
    end
    results
  end

  def my_transpose
    if self.length <= 1
      return self
    end
    transposed = Array.new(self.length) {Array.new(self.length)}

    self.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        transposed[i][j], transposed[j][i] = self[j][i], self[i][j]
      end
    end

    transposed
  end

  def stock_picker
    best_diff = -1
    best = []
    (0...self.length).each do |i|
      ((i + 1)...self.length).each do |j|
        diff = self[j] - self[i]
        if diff > best_diff
          best_diff = diff
          best = [i, j]
        end
      end
   end
   best
 end
end

class TOH

  attr_accessor :towers

  def initialize
    self.towers = Array.new(3){ Array.new}
    towers[0] += [3, 2, 1]
  end

  def first_pole
    self.towers[0]
  end

  def second_pole
    self.towers[1]
  end

  def third_pole
    self.towers[2]
  end

  def get_input
    puts "From where to where? ('x,y')"
    loc = gets.chomp
    from, to = loc.split(",")
    [from.to_i, to.to_i]
  end

  def move(pos)
    from, to = pos
    raise Error.new if towers[from].empty?
    bottom_disk = towers[to].last
    top_disk = towers[from].last
    raise Error.new if !towers[to].empty? && top_disk > bottom_disk

    towers[to] << towers[from].pop
  end

  def won?
    third_pole.length == 3
  end

  def game
    until won?
      p towers
      move(get_input)
    end
    p "you win"
  end

end
# TOH.new.game
