# frozen_string_literal: true

class UserInterface
  CLEAR_COMMAND = "\033[H\033[2J"
  INTRODUCTION_MESSAGE = 'Welcome to the quiz'
  PRESS_ANY_KEY_MESSAGE = 'Press any key to continue '

  def initialize(input, output)
    @input = input
    @output = output
  end

  def intro
    output.print CLEAR_COMMAND, INTRODUCTION_MESSAGE
    continue
  end

  private

  attr_reader :input, :output

  def continue
    output.print PRESS_ANY_KEY_MESSAGE
    input.getch
  end
end
