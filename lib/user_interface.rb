# frozen_string_literal: true

require 'colorize'
require 'quiz_messages'

class UserInterface
  def initialize(input, output)
    @input = input
    @output = output
  end

  def reset_screen
    output.print QuizMessages::CLEAR_COMMAND, QuizMessages::INTRODUCTION_HEADER
  end

  def intro(subject)
    output.print QuizMessages::INTRODUCTION_MESSAGE_ONE +
                 subject +
                 QuizMessages::INTRODUCTION_MESSAGE_TWO +
                 "\n\n"
    continue
  end

  def display_question(question)
    output.print question
  end

  def display_answer_choices(answers)
    each_formated_choice(answers) { |answer_choice| output.print answer_choice }
  end

  def collect_valid_choice(answers)
    max_letter_choice = (answers.length + QuizMessages::DECIMAL_COMPENSATOR - 1).chr

    loop do
      user_input = input.gets.chomp
      break user_input if user_input.match?(/^[a-#{max_letter_choice}]$/i)

      output.print QuizMessages::ERROR_MESSAGE + max_letter_choice + ': '
    end
  end

  def reveal_answer(answers, correct_answer)
    each_formated_choice(answers) do |answer_choice|
      if answer_choice[0] == correct_answer
        output.print answer_choice.colorize(:blue)
      else
        output.print answer_choice
      end
    end
  end

  def display_result_message(result_message)
    output.puts result_message
    continue
  end

  def display_total_score(score, questions_number)
    output.print "\n\n" + QuizMessages::TOTAL_MESSAGE, "[#{score}/#{questions_number}]\n\n"
  end

  private

  attr_reader :input, :output

  def continue
    output.print QuizMessages::PRESS_ANY_KEY_MESSAGE
    input.getch
  end

  def each_formated_choice(answers)
    output.print "\n\n"
    answers.each_index do |index|
      answer_choice = format_choice(answers, index)
      yield answer_choice
    end
    output.print "\n"
  end

  def format_choice(answers, index)
    margin = answers.max_by(&:length).length + 5
    answer_choice = "#{(index + QuizMessages::DECIMAL_COMPENSATOR).chr}) #{answers[index]}"
    return answer_choice.rjust(margin) + "\n" unless (index % 2).zero?

    answer_choice
  end
end
