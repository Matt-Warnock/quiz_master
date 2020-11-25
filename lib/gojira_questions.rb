# frozen_string_literal: true

module GojiraQestions
  CLEAR_COMMAND = "\033[H\033[2J"
  CORRECT_MESSAGE = 'Correct!'
  DECIMAL_COMPENSATOR = 97
  ERROR_MESSAGE = "I know what your playing at, you rebel! I'll only except a letter from a to "
  FIRST_QUESTION = ['How many members are in Gojira?', %w[3 5 4 6], 'c'].freeze
  SECOND_QUESTION = ['Which city in France does the band originate from?', %w[Nantes Bayonne Lyon Paris], 'b'].freeze
  THIRD_QUESTION = ["Gojira wasn't always known under that name, what was the original name of the band?",
                    ['Gorgonzola', 'Oihuka', 'Terra Incognita', 'Godzilla'], 'd'].freeze
  FORTH_QUESTION = ["What year was their debut album 'Terra Incognita' released?", %w[2001 1996 2003 2016], 'a'].freeze
  FIFTH_QUESTION = ["What album is the song 'Silvera' on?",
                    ['The Link', "L'Enfant Sauvage", 'From Mars to Sirius', 'Magma'], 'd'].freeze
  SIXTH_QUESTION = ["Complete this lyric: 'Another ______ a new place to be'", %w[girl world house planet], 'b'].freeze
  SEVENTH_QUESTION = ['How many studio albums has Gojira released?', %w[6 7 3 5], 'a'].freeze
  EIGHTH_QUESTION = ['Which two members of the band are related to each other?',
                     ['Joe & Christian', 'Mario & Joe', 'Christian & Mario'], 'b'].freeze
  NINTH_QUESTION = ['What year did Gojira sign to RoadRunner Records?', %w[2001 2003 2011 2015], 'c'].freeze
  TENTH_QUESTION = ['The Duplantier brothers formed an avant-garde metal band in 1998, what was the name of that band?',
                    ['Inflikted', 'Cavalera Conspiracy', 'Empalot', 'Brout'], 'c'].freeze
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
