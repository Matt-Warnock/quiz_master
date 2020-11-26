# frozen_string_literal: true

require 'user_interface'
require 'quiz_master'
require 'quiz_messages'

RSpec.describe QuizMaster do
  describe '#run' do
    let(:output) { StringIO.new }

    it 'clears the screen then prints header' do
      input = StringIO.new
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND + QuizMessages::INTRODUCTION_HEADER)
    end
  end
end
