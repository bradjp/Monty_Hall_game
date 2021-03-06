require 'game'

describe Game do

  subject(:double) { described_class.new }

  it 'initiates with an array of boxes, containing two goats and a car' do
    expect(subject.boxes).to eq(['Goat', 'Car', 'Goat'])
  end
  describe '#shuffle_boxes' do
    it 'randomly arranges the array' do
      expect(subject.boxes).to receive(:shuffle)
      subject.shuffle_boxes
    end
    it 'stores the shuffled boxes' do
      subject.shuffle_boxes
      expect(subject.shuffled_boxes.length).to eq(3) 
    end
  end
  describe '#select_box' do
    it 'allows the player to choose box 1,2 or 3' do
      subject.select_box(1)
      expect(subject.chosen_box).to eq(1)
      expect(subject.select_box(1)).to eq('You have chosen box 1')
    end
    it 'does not allow the player to choose a box other than 1,2 or 3' do
      current_chosen_box = subject.chosen_box
      subject.select_box(4)
      expect(subject.chosen_box).to eq(current_chosen_box)
      expect(subject.select_box(4)).to eq('Please choose 1,2 or 3')
    end
  end
  describe '#show_the_goat' do
    it 'Reveals a hidden goat, if a goat is chosen' do
      subject.select_box(1)
      expect(subject.show_the_goat).to eq('Box 3 contains a goat.
      Would you like to swap to box 2, or stick with 1?')
    end
    it 'Reveals a hidden goat, if the car is chosen' do
      subject.select_box(2)
      expect(subject.show_the_goat).to eq('Box 1 contains a goat.
      Would you like to swap to box 3, or stick with 2?')
    end
  end
  describe '#implement_switch_decision - choice Yes' do
      it 'swaps to a car from a goat' do
        subject.select_box(1)
        subject.show_the_goat
        expect(subject.implement_switch_decision('Yes')).to eq('You chose the car!')
      end
      it 'swaps to a goat from the car' do
        subject.select_box(2)
        subject.show_the_goat
        expect(subject.implement_switch_decision('Yes')).to eq('Oh no...You chose a goat!')
      end
  end
  describe '#implement_switch_decision - choice No' do
      it 'sticks with a goat' do
        subject.select_box(1)
        subject.show_the_goat
        expect(subject.implement_switch_decision('No')).to eq('Oh no...You chose a goat!')
      end
      it 'sticks with the car' do
        subject.select_box(2)
        subject.show_the_goat
        expect(subject.implement_switch_decision('No')).to eq('You chose the car!')
      end
  end
end
