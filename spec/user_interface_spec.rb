# frozen_string_literal: true

require 'user_interface'

RSpec.describe UserInterface do
  let(:output) { StringIO.new }

  describe '#intro' do
    let(:continue_input) { StringIO.new('x') }

    it 'clears the screen before printing message' do
      user_interface = described_class.new(continue_input, output)

      user_interface.intro

      expect(output.string).to include(described_class::CLEAR_COMMAND + described_class::INTRODUCTION_MESSAGE)
    end

    it 'prints an introduction to the screen' do
      user_interface = described_class.new(continue_input, output)

      user_interface.intro

      expect(output.string).to include(described_class::INTRODUCTION_MESSAGE)
    end

    it 'prompts user to press any key to continue' do
      user_interface = described_class.new(continue_input, output)

      user_interface.intro

      expect(output.string).to include(described_class::PRESS_ANY_KEY_MESSAGE)
    end

    it 'returns key stroke entered by user' do
      user_interface = described_class.new(continue_input, output)

      result = user_interface.intro

      expect(result).to eq('x')
    end
  end

  describe '#ask_question' do
    let(:correct_input) { StringIO.new("c\n") }

    it 'clears the screen before printing message' do
      user_interface = described_class.new(correct_input, output)

      user_interface.ask_question(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::CLEAR_COMMAND + described_class::FIRST_QUESTION[0])
    end

    it 'prints a question to the screen' do
      user_interface = described_class.new(correct_input, output)

      user_interface.ask_question(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::FIRST_QUESTION[0])
    end

    it 'prints answer choices to the screen' do
      user_interface = described_class.new(correct_input, output)

      user_interface.ask_question(described_class::FIRST_QUESTION)

      expect(output.string).to include(%(How many members are in Gojira?

a\) 3
b\) 5
c\) 4
d\) 6

))
    end

    it 'returns a vaild answer choice from user' do
      user_interface = described_class.new(correct_input, output)

      result = user_interface.ask_question(described_class::FIRST_QUESTION)

      expect(result).to eq('c')
    end

    it 'prints error message when invalid input is entered' do
      input = StringIO.new("f\nc\n")
      user_interface = described_class.new(input, output)

      user_interface.ask_question(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::ERROR_MESSAGE +
                                       (described_class::FIRST_QUESTION[1].length + 96).chr)
    end

    it 'keeps on asking for input until a vaild input is given' do
      input = StringIO.new("x\nf\nc\n")
      user_interface = described_class.new(input, output)

      user_interface.ask_question(described_class::FIRST_QUESTION)

      expect(output.string.scan(described_class::ERROR_MESSAGE).length).to eq(2)
    end
  end

  describe '#display_result' do
    let(:input) { StringIO.new('x') }

    it 'clears the screen before printing message' do
      user_interface = described_class.new(input, output)

      user_interface.display_result(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::CLEAR_COMMAND + described_class::FIRST_QUESTION[0])
    end

    it 'prints the question to the screen' do
      user_interface = described_class.new(input, output)

      user_interface.display_result(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::FIRST_QUESTION[0])
    end

    xit 'prints answer choices with the correct choice in blue text' do
      user_interface = described_class.new(input, output)

      user_interface.display_result(described_class::FIRST_QUESTION)

      expect(output.string).to include(%(How many members are in Gojira?

a\) 3
b\) 5
\e[34m c\) 4\e[0m
d\) 6

))
    end

    it 'prints result message to the screen' do
      user_interface = described_class.new(input, output)

      user_interface.display_result(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::CORRECT_MESSAGE)
    end

    it 'prompts user to press any key to continue' do
      user_interface = described_class.new(input, output)

      user_interface.display_result(described_class::FIRST_QUESTION)

      expect(output.string).to include(described_class::PRESS_ANY_KEY_MESSAGE)
    end

    it 'returns key stroke entered by user' do
      user_interface = described_class.new(input, output)

      result = user_interface.display_result(described_class::FIRST_QUESTION)

      expect(result).to eq('x')
    end
  end
end
