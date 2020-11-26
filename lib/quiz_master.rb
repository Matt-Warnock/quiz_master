# frozen_string_literal: true

class QuizMaster
  def initialize(user_interface)
    @user_interface = user_interface
  end

  def run
    user_interface.display_header
  end

  private

  attr_reader :user_interface
end
