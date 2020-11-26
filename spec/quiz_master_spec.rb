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

    it 'prints introduction with subject of quiz' do
      input = StringIO.new
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_ONE +
                                       GojiraQestions::SUBJECT +
                                       QuizMessages::INTRODUCTION_MESSAGE_TWO)
    end

    it 'asks user to press any key to continue after printing intro' do
      input = StringIO.new
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_TWO + QuizMessages::PRESS_ANY_KEY_MESSAGE)
    end

    it 'clears screen then prints header before asking question' do
      input = StringIO.new
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND +
                                       QuizMessages::INTRODUCTION_HEADER +
                                       GojiraQestions::QUESTIONS[0][0])
    end

    it 'asks user first question' do
      input = StringIO.new
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(GojiraQestions::QUESTIONS[0][0])
    end
  end
end
