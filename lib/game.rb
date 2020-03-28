class Game

  attr_reader :boxes

  def initialize
    @boxes = ['Goat', 'Car', 'Goat']
  end

  def shuffle_boxes
    @boxes.shuffle
  end

end