# frozen_string_literal: true

module Qestions
  SUBJECT = 'Gojira'
  FIRST = ['How many members are in Gojira?', %w[3 5 4 6], 'c'].freeze
  SECOND = ['Which city in France does the band originate from?', %w[Nantes Bayonne Lyon Paris], 'b'].freeze
  THIRD = ["Gojira wasn't always known under that name, what was the original name of the band?",
           ['Gorgonzola', 'Oihuka', 'Terra Incognita', 'Godzilla'], 'd'].freeze
  FORTH = ["What year was their debut album 'Terra Incognita' released?", %w[2001 1996 2003 2016], 'a'].freeze
  FIFTH = ["What album is the song 'Silvera' on?",
           ['The Link', "L'Enfant Sauvage", 'From Mars to Sirius', 'Magma'], 'd'].freeze
  SIXTH = ["Complete this lyric: 'Another ______ a new place to be'", %w[girl world house planet], 'b'].freeze
  SEVENTH = ['How many studio albums has Gojira released?', %w[6 7 3 5], 'a'].freeze
  EIGHTH = ['Which two members of the band are related to each other?',
            ['Joe & Christian', 'Mario & Joe', 'Christian & Mario'], 'b'].freeze
  NINTH = ['What year did Gojira sign to RoadRunner Records?', %w[2001 2003 2011 2015], 'c'].freeze
  TENTH = ['The Duplantier brothers formed an avant-garde metal band in 1998, what was the name of that band?',
           ['Inflikted', 'Cavalera Conspiracy', 'Empalot', 'Brout'], 'c'].freeze
  ALL = [FIRST, SECOND, THIRD, FORTH, FIFTH,
         SIXTH, SEVENTH, EIGHTH, NINTH, TENTH].freeze
end
