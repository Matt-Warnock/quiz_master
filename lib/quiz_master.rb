# frozen_string_literal: true

require 'gojira_questions'

class QuizMaster
  def initialize(user_interface)
    @ui = user_interface
    @user_score = 0
  end

  def run
    total_questions = GojiraQestions::QUESTIONS.length

    ui.reset_screen
    ui.intro(GojiraQestions::SUBJECT)
    ask_all_questions
    ui.display_total_score(@user_score, total_questions)
    score_comment(total_questions)
  end

  private

  def score_comment(total_questions)
    case (@user_score.to_f / total_questions) * 100
    when 67..100
      ui.display_result_message(QuizMessages::SCORE_COMMENT_HIGH)
    when 33..66
      ui.display_result_message(QuizMessages::SCORE_COMMENT_MED)
    else
      ui.display_result_message(QuizMessages::SCORE_COMMENT_LOW)
    end
  end

  def ask_all_questions
    GojiraQestions::QUESTIONS.each_index do |index|
      answer_choices = GojiraQestions::QUESTIONS[index][1]
      correct_answer = GojiraQestions::QUESTIONS[index][2]

      ui.reset_screen
      user_answer = ask_question(GojiraQestions::QUESTIONS[index][0], answer_choices)
      ui.reset_screen
      ui.reveal_answer(answer_choices, correct_answer)
      conclued_result(user_answer, correct_answer)
    end
  end

  def conclued_result(user_answer, correct_answer)
    if user_answer.downcase == correct_answer
      ui.display_result_message(QuizMessages::CORRECT_MESSAGE)
      @user_score += 1
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
