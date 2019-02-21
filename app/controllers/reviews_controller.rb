class ReviewsController < ApplicationController
    #Create
    get '/reviews/new' do
        if logged_in?
            @books = Book.all
            erb :'reviews/new'
        else
            redirect '/login'
        end
    end

    post '/reviews' do
        if params[:content].empty?
            redirect "/reviews/new"
        else
            @review = Review.new(content: params[:content])
            @review.member_id = current_member.id

            @books = Book.all
            this_book = @books.find {|book| book.title == params[:book]}
            @review.book_id = this_book.id

            @review.save
            binding.pry
            redirect "/books"
        end
    end

    #Read
    get '/reviews/:id' do

    end

    #Update
    get '/reviews/:id/edit' do

    end

    patch '/reviews/:id' do

    end

    #Delete
    delete '/reviews/:id/delete' do
        
    end
end