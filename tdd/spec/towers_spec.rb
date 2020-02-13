require "rspec"
require "towers"

describe Towers do
  subject(:tower) {Towers.new}

  describe "#initialize" do
    it "should create an instance of the Towers class" do
      expect(tower).to be_an_instance_of(Towers)
    end

    it "should initialize an array with 3 arrays inside" do
      expect(tower.stacks).to be_an_instance_of(Array)
      expect(tower.stacks.length).to eq(3)
    end
  end

  describe "#won?" do 
    let(:winning_tower) {Towers.new([ [], [] , [1,2,3,4,5,6,7,8] ])}
    let(:losing_tower) {Towers.new([[],[1],[2,3,4,5,6,7,8]])}
    context "when the game is won" do 
      it "should have all the disks in ANOTHER rod" do 
        expect(winning_tower.won?).to be true
      end
    end

    context "when the game is lost" do 
      it "should not have all the disks in a single rod that is not the first rod" do 
        expect(losing_tower.won?).to be false
      end
    end
  end

  describe "#move" do 
    let(:sample_tower) {Towers.new([ [], [1,2] , [3,4,5,6,7,8] ])}
    it "should accept a start rod and end rod" do
      expect{tower.move(0,1)}.to_not raise_error
      expect{tower.move(0,2)}.to_not raise_error
    end

    it "should raise an error if start or end rod doesnt exist" do
      expect{tower.move(7,2)}.to raise_error(InvalidMovesInputError)
    end

    it "should raise an error if the start rod is empty" do
      expect{sample_tower.move(0,1)}.to raise_error(InvalidMovesInputError)
    end

    it "should raise an error if the end rod has a smaller disk" do
      expect{sample_tower.move(2,1)}.to raise_error(InvalidMovesInputError)
    end
  end
end