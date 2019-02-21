class Book < ActiveRecord::Base
    has_many :member_books
    has_many :members, through: :member_books
    has_many :reviews


    def slug
        title.downcase.gsub(" ", "-")
    end
end