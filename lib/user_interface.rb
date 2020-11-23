# frozen_string_literal: true

require 'colorize'

class UserInterface
  CLEAR_COMMAND = "\033[H\033[2J"
  INTRODUCTION_MESSAGE = 'Welcome to the quiz'
  PRESS_ANY_KEY_MESSAGE = 'Press any key to continue '
  FIRST_QUESTION = ['How many members are in Gojira?', %w[3 5 4 6], 'c'].freeze
  DECIMAL_VALUE_COMPENSATOR = 97
  ERROR_MESSAGE = "I know what your playing at, you rebel! I'll only except a letter from a to "

  def initialize(input, output)
    @input = input
    @output = output
  end

  def intro
    output.print CLEAR_COMMAND, INTRODUCTION_MESSAGE
    continue
  end

  def display_question(question_array)
    output.print CLEAR_COMMAND, question_array[0], "\n\n"
    display_answer_choices(question_array)
    output.print "\n\n"
    collect_valid_choice(question_array)
  end

  private

  attr_reader :input, :output

  def continue
    output.print PRESS_ANY_KEY_MESSAGE
    input.getch
  end

  def display_answer_choices(question_array)
    question_array[1].each_index do |index|
      decimal = index + DECIMAL_VALUE_COMPENSATOR
      output.puts "#{decimal.chr}) #{question_array[1][index]}"
    end
  end

  def collect_valid_choice(question_array)
    max_letter = (question_array[1].length + 96).chr

    loop do
      user_input = input.gets.chomp
      break user_input if user_input.match?(/^[a-#{max_letter}]$/i)

      output.print ERROR_MESSAGE + max_letter
    end
  end
end
