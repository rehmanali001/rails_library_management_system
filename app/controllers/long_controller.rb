class LongController < ApplicationController
    def index
        @books = Book.long_word
    end 
end 