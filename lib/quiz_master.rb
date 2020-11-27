# frozen_string_literal: true

require 'gojira_questions'

class QuizMaster
  def initialize(user_interface)
    @ui = user_interface
  end

  def run
    ui.reset_screen
    ui.intro(GojiraQestions::SUBJECT)
    ask_all_questions
  end

  private

  def ask_all_questions
    GojiraQestions::QUESTIONS.each_index do |index|
      answer_choices = GojiraQestions::QUESTIONS[index][1]
      correct_answer = GojiraQestions::QUESTIONS[index][2]

      ui.reset_screen
      user_answer = ask_question(GojiraQestions::QUESTIONS[index][0], answer_choices)
      ui.reveal_answer(answer_choices, correct_answer)
      conclued_result(user_answer, correct_answer)
    end
  end

  def conclued_result(user_answer, correct_answer)
    if user_answer == correct_answer
      ui.display_result_message(QuizMessages::CORRECT_MESSAGE)
    else
      ui.display_result_message(QuizMessages::INCORRECT_MESSAGE)
    end
  end

  def ask_question(question, answer_choices)
    ui.display_question(question)
    ui.display_answer_choices(answer_choices)
    ui.collect_valid_choice(answer_choices)
  end

  attr_reader :ui
end
