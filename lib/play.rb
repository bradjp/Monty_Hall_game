require_relative 'game'

def play
  game = Game.new

  puts 'Shuffling boxes...'
  sleep(2)
  game.shuffle_boxes
  puts 'Shuffled!'

  puts 'Select box 1,2 or 3'

  box = gets.chomp.to_i

  game.select_box(box)

  puts "You have chosen box #{box}"

  game.show_the_goat
end