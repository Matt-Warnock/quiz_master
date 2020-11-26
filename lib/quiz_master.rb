# frozen_string_literal: true

require 'gojira_questions'

class QuizMaster
  def initialize(user_interface)
    @user_interface = user_interface
  end

  def run
    user_interface.display_header
    user_interface.intro(GojiraQestions::SUBJECT)
    user_interface.display_header
    user_interface.display_question(GojiraQestions::QUESTIONS[0][0])
  end

  private

  attr_reader :user_interface
end
