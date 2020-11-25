# frozen_string_literal: true

module QuizMessages
  CLEAR_COMMAND = "\033[H\033[2J"
  CONCLUSION_LOWER = 'Better luck next time!'
  CONCLUSION_MID = 'Well done! You did good.'
  CONCLUSION_HIGH = 'Well done! You know your stuff!'
  CORRECT_MESSAGE = 'Correct!'
  DECIMAL_COMPENSATOR = 97
  ERROR_MESSAGE = "I know what your playing at, you rebel! I'll only except a letter from a to "
  INCORRECT_MESSAGE = 'Ah, thats the wrong answer.'
  INTRODUCTION_HEADER = %(
    ---------------------

         Quiz Master

    ---------------------


  )
  INTRODUCTION_MESSAGE_ONE = 'Welcome to the quiz! I heared that you know alot about '
  INTRODUCTION_MESSAGE_TWO = ", so lets test that knowlage!
 I'll asks you some multi-choice questions,
 type the letter of the question choice (a, b, or c ect..) and then press enter."
  PRESS_ANY_KEY_MESSAGE = 'Press any key to continue '
  TOTAL_MESSAGE = 'Total score: '
end
