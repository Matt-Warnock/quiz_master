# frozen_string_literal: true

require 'user_interface'
require 'quiz_master'
require 'quiz_messages'

RSpec.describe QuizMaster do
  describe '#run' do
    let(:output) { StringIO.new }
    let(:input) { StringIO.new("\nb\n") }

    it 'clears the screen then prints header' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND + QuizMessages::INTRODUCTION_HEADER)
    end

    it 'prints introduction with subject of quiz' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_ONE +
                                       GojiraQestions::SUBJECT +
                                       QuizMessages::INTRODUCTION_MESSAGE_TWO)
    end

    it 'asks user to press any key to continue after printing intro' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_TWO + QuizMessages::PRESS_ANY_KEY_MESSAGE)
    end

    it 'clears screen then prints header before asking question' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND +
                                       QuizMessages::INTRODUCTION_HEADER +
                                       GojiraQestions::QUESTIONS[0][0])
    end

    it 'asks user first question' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(GojiraQestions::QUESTIONS[0][0])
    end

    it 'displays answer choices' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(GojiraQestions::QUESTIONS[0][1][0],
                                       GojiraQestions::QUESTIONS[0][1][1],
                                       GojiraQestions::QUESTIONS[0][1][2],
                                       GojiraQestions::QUESTIONS[0][1][3])
    end

    it 'clears screen then prints header before reveling correct answer' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND +
                                       QuizMessages::INTRODUCTION_HEADER,
                                       "\e[0;34;49mc) #{GojiraQestions::QUESTIONS[0][1][2]}\e[0m")
    end

    it 'displays a congratulatory message if user answer is correct' do
      correct_answer_input = StringIO.new("\nc\n")
      user_interface = UserInterface.new(correct_answer_input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CORRECT_MESSAGE)
    end

    it 'displays a consolatory message if user answer is incorrect' do
      correct_answer_input = StringIO.new("\nd\n")
      user_interface = UserInterface.new(correct_answer_input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::INCORRECT_MESSAGE)
    end
  end
end
