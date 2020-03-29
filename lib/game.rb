class Game

  attr_reader :boxes, :chosen_box, :shuffled_boxes

  def initialize
    @boxes = ['Goat', 'Car', 'Goat']
    @chosen_box = nil
    @shuffled_boxes = {1 => 'Goat', 2 => 'Car', 3 => 'Goat'}
  end

  def shuffle_boxes
    @boxes.shuffle
    @shuffled_boxes = {1 => @boxes[0], 2 => @boxes[1], 3 => @boxes[2]}
    'Shuffled!'
  end

  def select_box(box)
    return 'Please choose 1,2 or 3' if box > 3 || box < 1
    @chosen_box = box
    "You have chosen box #{box}"
  end

  def show_the_goat
    if @chosen_box == 'Car'
      #show one of the goats
    else
      @shuffled_boxes.delete(@chosen_box)
      "Box #{@shuffled_boxes.key('Goat')} contains a goat.
      Would you like to swap to box #{@shuffled_boxes.key('Car')}, or stick with #{@chosen_box}?"
    end
  end

end