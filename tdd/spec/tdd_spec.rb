require "tdd"
require "byebug"

describe "Array" do
  describe "#my_uniq" do
    it "should take in an array and return an array" do
      expect([].my_uniq).to be_an_instance_of(Array)
    end

    it "should not return any duplicate values in the arry" do
      expect([1,1,1,2].my_uniq).to eq([1,2])
    end
  end

  describe "#two_sum" do 
    it "should take in an array and return an array" do
        expect([].two_sum).to be_an_instance_of(Array)
    end

    it "should return an array of positions where they sum up to 0" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
      expect([2,-2, 1, -1, 3].two_sum).to eq([[0,1],[2,3]])
    end
  end

  describe "#my_transpose" do 
  let(:arr) {Array.new(3){Array.new(3)}}
  let(:test_arr) {[[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]]}
    it "should return an array of the same length" do 
      expect([[1, 2, 3],[4, 5]].my_transpose.length).to eq(2)
    end

    it "should take in an array and return a new array" do
      expect(arr.my_transpose.object_id).to_not eq(arr.object_id)
    end

    it "should flip the rows and cols in the original array" do 
      expect(test_arr.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe "#stock_picker" do
  let(:arr)  {[1,2,8,7].stock_picker}
    it "should have the second day index greater than the first day index" do
      expect(arr[1]).to be > arr[0]
    end

    it "should return the most profitable pair of days" do
      expect(arr).to eq([0,2])
    end
  end
end

