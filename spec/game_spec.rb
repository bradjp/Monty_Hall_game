require 'game'

describe Game do

  subject(:double) { described_class.new }

  it 'initiates with an array of boxes, containing two goats and a car' do
    expect(subject.boxes).to eq(['Goat', 'Car', 'Goat'])
  end
  describe '#shuffle_boxes' do
    it 'randomly arranges the array' do
      expect(subject.boxes).to receive(:shuffle!)
      subject.shuffle_boxes
    end
  end
  describe '#select_box' do
    it 'allows the player to choose box 1,2 or 3' do
      subject.select_box(1)
      expect(subject.chosen_box).to eq(subject.boxes[0])
      expect(subject.select_box(1)).to eq('You have chosen box 1')
    end
    it 'does not allow the player to choose a box other than 1,2 or 3' do
      current_chosen_box = subject.chosen_box
      subject.select_box(4)
      expect(subject.chosen_box).to eq(current_chosen_box)
      expect(subject.select_box(4)).to eq('Please choose 1,2 or 3')
    end
  end
end
