# frozen_string_literal: true

require 'gojira_questions'
require 'user_interface'

RSpec.describe UserInterface do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  describe '#reset_screen' do
    it 'clears the screen before printing header' do
      user_interface = described_class.new(input, output)

      user_interface.reset_screen

      expect(output.string).to include(QuizMessages::CLEAR_COMMAND +
                                       QuizMessages::INTRODUCTION_HEADER)
    end
  end

  describe '#intro' do
    let(:subject) { 'subject' }

    it 'prints an introduction to the screen' do
      user_interface = described_class.new(input, output)

      user_interface.intro(subject)

      expect(output.string).to include(QuizMessages::INTRODUCTION_MESSAGE_ONE +
                                       subject +
                                       QuizMessages::INTRODUCTION_MESSAGE_TWO)
    end

    it 'prompts user to press any key to continue' do
      user_interface = described_class.new(input, output)

      user_interface.intro(subject)

      expect(output.string).to include(QuizMessages::PRESS_ANY_KEY_MESSAGE)
    end

    it 'returns key stroke entered by user' do
      continue_input = StringIO.new('x')
      user_interface = described_class.new(continue_input, output)

      result = user_interface.intro(subject)

      expect(result).to eq('x')
    end
  end

  describe '#display_question' do
    it 'prints a question to the screen' do
      user_interface = described_class.new(input, output)

      user_interface.display_question(test_question_set[0])

      expect(output.string).to include(test_question_set[0])
    end
  end

  describe '#display_answer_choices' do
    it 'prints answer choices to the screen' do
      user_interface = described_class.new(input, output)

      user_interface.display_answer_choices(test_question_set[1])

      expect(output.string).to eq("

a) #{test_question_set[1][0]}  b) #{test_question_set[1][1]}
c) #{test_question_set[1][2]}                d) #{test_question_set[1][3]}

")
    end
  end

  describe '#collect_valid_choice' do
    it 'returns a vaild answer choice from user' do
      correct_input = StringIO.new("c\n")
      user_interface = described_class.new(correct_input, output)

      result = user_interface.collect_valid_choice(test_question_set[1])

      expect(result).to eq('c')
    end

    it 'prints error message stating maximum choice excepted when invalid input is entered' do
      input = StringIO.new("f\nc\n")
      user_interface = described_class.new(input, output)

      user_interface.collect_valid_choice(test_question_set[1])

      expect(output.string).to include(QuizMessages::ERROR_MESSAGE +
                                      (test_question_set[1].length + 96).chr)
    end

    it 'keeps on asking for input until a vaild input is given' do
      input = StringIO.new("x\nf\nc\n")
      user_interface = described_class.new(input, output)

      user_interface.collect_valid_choice(test_question_set[1])

      expect(output.string.scan(QuizMessages::ERROR_MESSAGE).length).to eq(2)
    end
  end

  describe '#reveal_answer' do
    it 'prints answer choices with the correct choice in blue text' do
      user_interface = described_class.new(input, output)

      user_interface.reveal_answer(test_question_set[1], test_question_set[2])

      expect(output.string).to eq("

a) #{test_question_set[1][0]}  b) #{test_question_set[1][1]}
\e[0;34;49mc) #{test_question_set[1][2]}\e[0m                d) #{test_question_set[1][3]}

")
    end
  end

  describe '#display_result_message' do
    it 'prints result message to the screen' do
      user_interface = described_class.new(input, output)

      user_interface.display_result_message(QuizMessages::CORRECT_MESSAGE)

      expect(output.string).to include(QuizMessages::CORRECT_MESSAGE)
    end

    it 'prompts user to press any key to continue' do
      user_interface = described_class.new(input, output)

      user_interface.display_result_message(QuizMessages::CORRECT_MESSAGE)

      expect(output.string).to include(QuizMessages::PRESS_ANY_KEY_MESSAGE)
    end

    it 'returns key stroke entered by user' do
      continue_input = StringIO.new('x')
      user_interface = described_class.new(continue_input, output)

      result = user_interface.display_result_message(QuizMessages::CORRECT_MESSAGE)

      expect(result).to eq('x')
    end
  end

  describe '#display_total_score' do
    it 'prints the amout of questions correct with total possible' do
      user_interface = described_class.new(input, output)

      user_interface.display_total_score(3, 10)

      expect(output.string).to include(QuizMessages::TOTAL_MESSAGE + '[3/10]')
    end
  end

  def test_question_set
    ['The Duplantier brothers formed an avant-garde metal band in 1998, what was the name of that band?',
     ['Inflikted', 'Cavalera Conspiracy', 'Empalot', 'Brout'], 'c']
  end
end
