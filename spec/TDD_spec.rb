require "rspec"
require "TDD"

describe '#my_uniq' do

  let (:empty_arr) {[]}
  let (:no_dup) {[1, 2, 3, 4]}
  let (:many_dup) {[1, 1, 2, 3, 3, 3, 4]}

  it "returns an empty array" do
    expect(empty_arr.my_uniq).to eq([])
  end

  it "returns original array" do
    expect(no_dup.my_uniq).to eq([1,2,3,4])
  end

  it "returns only unique elements" do
    expect(many_dup.my_uniq).to eq([1,2,3,4])
  end
end

describe '#two_sum' do

  let(:empty_arr) { [] }
  let(:no_sums) { [1, 2, 3, 4, 5] }
  let(:one_sum) { [0, 1, 2, -1] }
  let(:many_sums) { [-1, 0, 2, -2, 1] }

  it "returns an empty array" do
    expect(empty_arr.two_sum).to eq([])
  end

  it "returns empty array if no sum is found" do
    expect(no_sums.two_sum).to eq([])
  end

  it "returns the position" do
    expect(one_sum.two_sum).to eq([[1, 3]])
  end

  it "returns multiple positions" do
    expect(many_sums.two_sum).to eq([[0, 4], [2, 3]])
  end

end

describe "#my_transpose" do

  let(:empty_arr) {[]}
  let(:one_by_one) {[[7]]}
  let(:two_by_two) {[[1, 3],[2, 4]]}
  let(:four_by_four) {[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]}

  it "returns an empty array" do
    expect(empty_arr.my_transpose).to eq([])
  end

  it "returns a single element" do
    expect(one_by_one.my_transpose).to eq([[7]])
  end

  it "returns a 2D transposed matrix" do
    expect(two_by_two.my_transpose).to eq([[1, 2], [3, 4]])
  end

  it "returns a 4x4 transposed matrix " do
    expect(four_by_four.my_transpose).to eq([[1, 5, 9, 13], [2, 6, 10, 14],
                                             [3, 7, 11, 15], [4, 8, 12, 16]])
  end

  it "doesn't modify the original array" do
    four_by_four.my_transpose
    expect(four_by_four).to eq([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])
  end

end

describe "#stock_picker" do

  let(:empty_arr) {[]}
  let(:one_day) {[37]}
  let(:no_best_day) { [9, 8, 7, 6, 5, 4] }
  let(:best_case_longest) { [1, 2, 3, 4, 5, 9, 10] }
  let(:best_case_in_middle) { [10, 8, 6, 5, 9, 8, 7, 15, 12] }

  it "returns nil if empty array" do
    expect(empty_arr.stock_picker).to eq([])
  end

  it "returns nil if one day" do
    expect(one_day.stock_picker).to eq ([])
  end

  it "returns nil if no best day" do
    expect(no_best_day.stock_picker).to eq([])
  end

  it "returns the best pair of days" do
    expect(best_case_longest.stock_picker).to eq([0, 6])
  end
  it "returns the best pair" do
    expect(best_case_in_middle.stock_picker).to eq([3, 7])
  end

end

describe TOH do

  let(:game) { TOH.new }

  describe "#towers" do
    it "returns an object with three arrays" do
      expect(game.towers).to be_kind_of(Array)
    end

    it "returns a array with three discs on first row" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#first_pole" do
    it "#first_pole returns first pole" do
      game.towers[0]  << 1
      expect(game.first_pole).to eq([3, 2, 1, 1])
    end
  end

  describe "#second_pole" do
    it "returns second pole" do
      game.towers[1] << 1
      expect(game.second_pole).to eq([1])
    end
  end

  describe "#third_pole" do
    it "returns third pole" do
      game.towers[2] << 1
      expect(game.third_pole).to eq([1])
    end
  end

  describe "#won" do
    it "knows game is still running" do
      expect(game.won?).to eq(false)
    end

    it "knows game is won" do
      game.towers[2] = game.towers[0]
      game.towers[0] = []
      expect(game.won?).to eq(true)
    end
  end

  describe "#move" do
    it "moves the disks" do
      game.move([0, 1])
      #will be moving from
      game.move([0, 2])
      expect(game.towers).to eq([[3], [1], [2]])
    end

    it "checks errors" do
      expect {game.move([2, 0])}.to raise_error
      game.move([0, 1])
      game.move([0, 2])
      expect {game.move([2, 1])}.to raise_error
    end
  end

end
