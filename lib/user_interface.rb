# frozen_string_literal: true

class UserInterface
  CLEAR_COMMAND = "\033[H\033[2J"
  INTRODUCTION_MESSAGE = 'Welcome to the quiz'

  def initialize(output)
    @output = output
  end

  def intro
    @output.print CLEAR_COMMAND, INTRODUCTION_MESSAGE
  end
end
