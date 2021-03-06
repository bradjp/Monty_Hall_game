class Game

  attr_reader :boxes, :chosen_box, :shuffled_boxes

  def initialize
    @boxes = ['Goat', 'Car', 'Goat']
    @chosen_box = nil
    @shuffled_boxes = {1 => 'Goat', 2 => 'Car', 3 => 'Goat'}
    @tentative_choice = nil
  end

  def shuffle_boxes
    @boxes.shuffle
    update_shuffled_boxes
    'Shuffled!'
  end

  def select_box(box)
    return 'Please choose 1,2 or 3' if box > 3 || box < 1
    @chosen_box = box
    "You have chosen box #{box}"
  end

  def show_the_goat
    if @shuffled_boxes[@chosen_box] == 'Car'
      react_to_car_choice
    else
      react_to_goat_choice
    end
  end

  def implement_switch_decision(choice)
    if choice == 'Yes'
      @tentative_choice == 'Car' ? 'Oh no...You chose a goat!' : 'You chose the car!'
    else
      @tentative_choice == 'Car' ? 'You chose the car!' : 'Oh no...You chose a goat!'
    end
  end

  private

  def update_shuffled_boxes
    @shuffled_boxes = {1 => @boxes[0], 2 => @boxes[1], 3 => @boxes[2]}
  end

  def react_to_car_choice
      process_choice
      goats = @shuffled_boxes.keys
      "Box #{goats[0]} contains a goat.
      Would you like to swap to box #{goats[1]}, or stick with #{@chosen_box}?"
  end

  def react_to_goat_choice
    process_choice
    "Box #{@shuffled_boxes.key('Goat')} contains a goat.
      Would you like to swap to box #{@shuffled_boxes.key('Car')}, or stick with #{@chosen_box}?"
  end

  def process_choice
    @tentative_choice = @shuffled_boxes[@chosen_box]
    @shuffled_boxes.delete(@chosen_box)
  end

end