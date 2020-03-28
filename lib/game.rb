class Game

  attr_reader :boxes, :chosen_box

  def initialize
    @boxes = ['Goat', 'Car', 'Goat']
    @chosen_box = nil
  end

  def shuffle_boxes
    @boxes.shuffle!
    'Shuffled!'
  end

  def select_box(box)
    return 'Please choose 1,2 or 3' if box > 3 || box < 1
    @chosen_box = @boxes[box-1]
    "You have chosen box #{box}"
  end

end