# frozen_string_literal: true

module GojiraQestions
  CLEAR_COMMAND = "\033[H\033[2J"
  CORRECT_MESSAGE = 'Correct!'
  DECIMAL_COMPENSATOR = 97
  ERROR_MESSAGE = "I know what your playing at, you rebel! I'll only except a letter from a to "
  FIRST_QUESTION = ['How many members are in Gojira?', %w[3 5 4 6], 'c'].freeze
  INCORRECT_MESSAGE = 'Ah, thats the wrong answer.'
  INTRODUCTION_HEADER = %(
    ---------------------

         Quiz Master

    ---------------------


)
  INTRODUCTION_MESSAGE_ONE = 'Welcome to the quiz! I heared that you know alot about '
  INTRODUCTION_MESSAGE_TWO = ", so lets test that knowlage.
 I'll asks you some multi-choice questions,
 type the letter of the question choice(a, b, or c ect..) and then press enter."
  PRESS_ANY_KEY_MESSAGE = 'Press any key to continue '
  TOTAL_MESSAGE = 'Total score: '
  QESTIONS_SUBJECT = 'Gojira'
end
