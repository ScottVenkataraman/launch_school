=begin 
Build a rock paper scissors game, where the player competes against a computer.


Input: User inputs a string to signify their choice of "rock", "paper" or "scissors"
Output: String stating who won

Rules:
  If both contestants make the same choice, it's a tie.
  Rock beats scissors, scissors beats paper, paper beats rock
  Computer needs to choose one of the three options randomly. 

Data: 
  Strings

Algorithm:
  Generally the flow should be as follows:
  Helper method for prompt output
  Helper method for comparing the user and computer choices
    Define a method that accepts two string arguments
      IF the two arguments are equal
        return "Tie"
      IF the first argument is rock 
         if second argument is scissors 
          first arg wins
         else 
          second arg wins
      ELSIF first arg is paper 
          .....
      ELSIF first arg is scissors 


    1) The user makes a choice
      Prompt the user to make a choice and give them the options
      GET their choice and convert it to something usable
        CHECK if they picked one of the options
          Prompt them to use one of the given options if they input something incorrectly. 
          Assign their choice to a variable 
    2) The computer makes a choice
      Make the program choose a random option from the three and assign it to a variable signifying the computer choice 
    3) Compare the choices
      Display the winner or if it's a tie



=end 
def prompt(str)
  puts "==> #{str}"
  end
  
  def compare_choices(arg1, arg2)
    return "Tie" if arg1 == arg2
    if arg1 == 'rock'
      arg2 == 'scissors' ? arg1 : arg2 
    elsif arg1 == 'paper'
     arg2 == 'rock' ? arg1 : arg2 
    elsif arg1 == 'scissors'
      arg2 == 'paper' ? arg1 : arg2
    end
  end
  
#Start
  user_choice = ''
    computer_choice = ''
    CHOICE_OPTIONS = ['rock', 'paper', 'scissors']
  #Game Loop 
  loop do 
    puts "Welcome to Rock, Paper, Scissors"
  
  
    #GET User Choice
    loop do
      prompt("Please select 'rock', 'paper', or 'scissors'")
      user_choice = gets.chomp.downcase
      break if CHOICE_OPTIONS.include?(user_choice)
      puts "That was not one of the options, please try again."
    end  
  
    #SET computer choice
    computer_choice = CHOICE_OPTIONS.sample
    outcome = compare_choices(user_choice, computer_choice)
    #Output the computer choice and the outcome 
    puts "The computer chose #{computer_choice}"
    puts "You won!" if outcome == user_choice
    puts "The computer won" if outcome == computer_choice
    puts "It's a tie" if outcome == 'Tie'
  
    prompt("Would you like to play again? Y/N")
    play_again = gets.chomp.downcase
    break if play_again == 'n'
  end
  
  puts "Thanks for playing"