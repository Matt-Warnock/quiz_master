# frozen_string_literal: true

require 'user_interface'
require 'quiz_master'
require 'quiz_messages'

RSpec.describe QuizMaster do
  describe '#run' do
    let(:input) { "\n" + ("a\n\n" * 10) }
    let(:output) { StringIO.new }

    it 'clears the screen then prints header' do
      run_setup_with_input(input)

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND + QuizMessages::INTRODUCTION_HEADER)
    end

    it 'prints introduction with subject of quiz' do
      run_setup_with_input(input)

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_ONE +
                                       GojiraQestions::SUBJECT +
                                       QuizMessages::INTRODUCTION_MESSAGE_TWO)
    end

    it 'asks user to press any key to continue after printing intro' do
      run_setup_with_input(input)

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_TWO +
                                       "\n\n" +
                                       QuizMessages::PRESS_ANY_KEY_MESSAGE)
    end

    it 'clears screen then prints header before asking question' do
      run_setup_with_input(input)

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND +
                                       QuizMessages::INTRODUCTION_HEADER +
                                       GojiraQestions::QUESTIONS[0][0])
    end

    it 'asks user first question' do
      run_setup_with_input(input)

      expect(output.string).to include(GojiraQestions::QUESTIONS[0][0])
    end

    it 'displays answer choices' do
      run_setup_with_input(input)

      expect(output.string).to include(GojiraQestions::QUESTIONS[0][1][0],
                                       GojiraQestions::QUESTIONS[0][1][1],
                                       GojiraQestions::QUESTIONS[0][1][2],
                                       GojiraQestions::QUESTIONS[0][1][3])
    end

    it 'clears screen then prints header before reveling correct answer' do
      run_setup_with_input(input)

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND +
                                       QuizMessages::INTRODUCTION_HEADER,
                                       "\e[0;34;49mc) #{GojiraQestions::QUESTIONS[0][1][2]}\e[0m")
    end

    it 'displays a congratulatory message if user answer is correct' do
      correct_answers_path = "\nc\n\nb\n\nd\n\na\n\nd\n\nb\n\na\n\nb\n\nc\n\nc\n\n"
      run_setup_with_input(correct_answers_path)

      expect(output.string).to include(QuizMessages::CORRECT_MESSAGE)
    end

    it 'execpts captitalized answers' do
      correct_answers_path = "\nC\n\nB\n\nD\n\nA\n\nD\n\nB\n\nA\n\nB\n\nC\n\nC\n\n"
      run_setup_with_input(correct_answers_path)

      expect(output.string).to include(QuizMessages::CORRECT_MESSAGE)
    end

    it 'displays a consolatory message if user answer is incorrect' do
      incorrect_answers_path = "\na\n\na\n\na\n\nb\n\na\n\na\n\nb\n\na\n\na\n\na\n\n"
      run_setup_with_input(incorrect_answers_path)

      expect(output.string).to include(QuizMessages::INCORRECT_MESSAGE)
    end

    it 'asks all the questions' do
      run_setup_with_input(input)

      expect(output.string.scan('?').length).to eq(9)
    end

    it 'shows total user score with maximum possible' do
      run_setup_with_input(input)

      expect(output.string).to include('[2/10]')
    end

    it 'comments user did very well if score is higher than 2/3 of max score' do
      pass_eight_qestions = "\na\n\na\n\nd\n\na\n\nd\n\nb\n\na\n\nb\n\nc\n\nc\n\n"
      run_setup_with_input(pass_eight_qestions)

      expect(output.string).to include(QuizMessages::SCORE_COMMENT_HIGH)
    end

    it 'comments user did ok if score is between 1/3 and 2/3 of max score' do
      pass_four_qestions = "\nc\n\nb\n\nd\n\na\n\na\n\na\n\nb\n\na\n\na\n\na\n\n"
      run_setup_with_input(pass_four_qestions)

      expect(output.string).to include(QuizMessages::SCORE_COMMENT_MED)
    end

    it 'comments user will have better luck next time if score is lower than 1/3 of max score' do
      pass_two_questions = "\nc\n\nb\n\nb\n\nb\n\na\n\na\n\nb\n\na\n\na\n\na\n\n"
      run_setup_with_input(pass_two_questions)

      expect(output.string).to include(QuizMessages::SCORE_COMMENT_LOW)
    end
  end

  def run_setup_with_input(string)
    user_interface = UserInterface.new(StringIO.new(string), output)
    described_class.new(user_interface).run
  end
end
