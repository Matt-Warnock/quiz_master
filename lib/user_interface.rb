# frozen_string_literal: true

require 'colorize'

class UserInterface
  CLEAR_COMMAND = "\033[H\033[2J"
  CORRECT_MESSAGE = 'Correct!'
  INTRODUCTION_MESSAGE = 'Welcome to the quiz'
  PRESS_ANY_KEY_MESSAGE = 'Press any key to continue '
  FIRST_QUESTION = ['How many members are in Gojira?', %w[3 5 4 6], 'c'].freeze
  DECIMAL_COMPENSATOR = 97
  ERROR_MESSAGE = "I know what your playing at, you rebel! I'll only except a letter from a to "

  def initialize(input, output)
    @input = input
    @output = output
  end

  def intro
    output.print CLEAR_COMMAND, INTRODUCTION_MESSAGE
    continue
  end

  def ask_question(question_array)
    display_question(question_array)
    collect_valid_choice(question_array)
  end

  def display_result(question_array, result_message)
    display_question(question_array)
    output.print result_message
    continue
  end

  private

  attr_reader :input, :output

  def continue
    output.print PRESS_ANY_KEY_MESSAGE
    input.getch
  end

  def display_question(question_array)
    output.print CLEAR_COMMAND, question_array[0], "\n\n"
    display_answer_choices(question_array)
    output.print "\n\n"
  end

  def display_answer_choices(question_array)
    answers = question_array[1]

    answers.each_index do |index|
      answer_choice = format_choices(answers, index)
      yield answer_choice if block_given?
      output.print answer_choice
    end
  end

  def format_choices(answers, index)
    margin = answers.max_by(&:length).length + 5
    answer_choice = "#{(index + DECIMAL_COMPENSATOR).chr}) #{answers[index]}"
    return answer_choice.rjust(margin) + "\n" unless (index % 2).zero?

    answer_choice
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
