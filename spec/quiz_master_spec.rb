# frozen_string_literal: true

require 'user_interface'
require 'quiz_master'
require 'quiz_messages'

RSpec.describe QuizMaster do
  describe '#run' do
    let(:output) { StringIO.new }
    answer_one_quesion = "a\n\n"
    let(:input) { StringIO.new("\n" + (answer_one_quesion * 10)) }

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
      correct_answers_path = "\nc\n\nb\n\nd\n\na\n\nd\n\nb\n\na\n\nb\n\nc\n\nc\n\n"
      input = StringIO.new(correct_answers_path)
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::CORRECT_MESSAGE)
    end

    it 'displays a consolatory message if user answer is incorrect' do
      incorrect_answers_path = "\na\n\na\n\na\n\nb\n\na\n\na\n\nb\n\na\n\na\n\na\n\n"
      input = StringIO.new(incorrect_answers_path)
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::INCORRECT_MESSAGE)
    end

    it 'asks all the questions' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string.scan('?').length).to eq(9)
    end

    it 'shows total user score with maximum possible' do
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include('[2/10]')
    end

    it 'comments user did very well if score is higher than 2/3 of max score' do
      pass_eight_qestions = "\na\n\na\n\nd\n\na\n\nd\n\nb\n\na\n\nb\n\nc\n\nc\n\n"
      input = StringIO.new(pass_eight_qestions)
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::SCORE_COMMENT_HIGH)
    end

    it 'comments user did ok if score is between 1/3 and 2/3 of max score' do
      pass_four_qestions = "\nc\n\nb\n\nd\n\na\n\na\n\na\n\nb\n\na\n\na\n\na\n\n"
      input = StringIO.new(pass_four_qestions)
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::SCORE_COMMENT_MED)
    end

    it 'comments user will have better luck next time if score is lower than 1/3 of max score' do
      pass_two_qestions = "\nc\n\nb\n\nb\n\nb\n\na\n\na\n\nb\n\na\n\na\n\na\n\n"
      input = StringIO.new(pass_two_qestions)
      user_interface = UserInterface.new(input, output)
      controler = QuizMaster.new(user_interface)

      controler.run

      expect(output.string).to include(QuizMessages::SCORE_COMMENT_LOW)
    end
  end
end
