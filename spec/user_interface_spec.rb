# frozen_string_literal: true

require 'user_interface'

RSpec.describe UserInterface do
  describe '#intro' do
    it 'clears the screen before printing message' do
      output = StringIO.new
      user_interface = described_class.new(output)

      user_interface.intro

      expect(output.string).to include(described_class::CLEAR_COMMAND + described_class::INTRODUCTION_MESSAGE)
    end
    it 'prints an introduction to the screen' do
      output = StringIO.new
      user_interface = described_class.new(output)

      user_interface.intro

      expect(output.string).to include(described_class::INTRODUCTION_MESSAGE)
    end
  end
end
