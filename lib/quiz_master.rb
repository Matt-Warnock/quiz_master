# frozen_string_literal: true

require 'gojira_questions'

class QuizMaster
  def initialize(user_interface)
    @ui = user_interface
  end

  def run
    answer_choices = GojiraQestions::QUESTIONS[0][1]
    correct_answer = GojiraQestions::QUESTIONS[0][2]

    display_intro
    user_answer = ask_question(GojiraQestions::QUESTIONS[0][0], answer_choices)
    display_reveled_answer(answer_choices, correct_answer)
    conclued_result(user_answer, correct_answer)
  end

  private

  def conclued_result(user_answer, correct_answer)
    if user_answer == correct_answer
      ui.display_result_message(QuizMessages::CORRECT_MESSAGE)
    else
      ui.display_result_message(QuizMessages::INCORRECT_MESSAGE)
    end
  end

  def ask_question(question, answer_choices)
    ui.display_header
    ui.display_question(question)
    ui.display_answer_choices(answer_choices)
    ui.collect_valid_choice(answer_choices)
  end

  def display_reveled_answer(answer_choices, correct_answer)
    ui.display_header
    ui.reveal_answer(answer_choices, correct_answer)
  end

  def display_intro
    ui.display_header
    ui.intro(GojiraQestions::SUBJECT)
  end
  attr_reader :ui
end
