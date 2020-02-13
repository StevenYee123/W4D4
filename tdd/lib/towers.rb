class InvalidMovesInputError < StandardError
end

class Towers
  attr_reader :stacks
  def initialize(stacks = nil)
    @stacks = stacks
    if stacks.nil?
      @stacks = Array.new(3)
      build_stacks
    end
  end

  def won?
    if stacks.count { |ele| ele.count > 0} == 1 && stacks[0].empty?
      return true
    end
    false
  end

  def move(start_rod,end_rod)
    raise InvalidMovesInputError.new("out of bounds") if !start_rod.between?(0,2) || !end_rod.between?(0,2)
    raise InvalidMovesInputError.new("start stack is empty") if stacks[start_rod].empty?
    raise InvalidMovesInputError.new("invalid end stack") if !stacks[end_rod].empty? && stacks[start_rod].first > stacks[end_rod].first
    disk = stacks[start_rod].shift
    stacks[end_rod].unshift(disk)
  end

  private
  attr_writer :stacks

  def build_stacks
    stacks[0] = [1,2,3,4,5,6,7,8]
    stacks[1] = []
    stacks[2] = []
  end

  public
  def play
    until won?
      p stacks
      begin
        puts "enter a start and end rod"
        rods = gets.chomp.split(" ").map(&:to_i)
        start_rod,end_rod = rods
        move(start_rod,end_rod)
      rescue InvalidMovesInputError => e
        p e.message
        retry
      end
    end
    "Winner!"
  end
  
end

if __FILE__ == $PROGRAM_NAME
  t = Towers.new
  t.play
end