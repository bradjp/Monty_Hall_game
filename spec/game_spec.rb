require 'game'

describe Game do

  subject(:double) { described_class.new }

  it 'initiates with an array of boxes, containing two goats and a car' do
    expect(subject.boxes).to eq(['Goat', 'Car', 'Goat'])
  end
  describe '#shuffle_boxes' do
    it 'randomly arranges the array' do
      expect(subject.boxes).to receive(:shuffle)
      subject.shuffle_boxes()
    end
  end
end
