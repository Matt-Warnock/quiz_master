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
end
