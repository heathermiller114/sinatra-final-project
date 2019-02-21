class BooksController < ApplicationController
    get '/books' do
        if !logged_in?
            redirect "/login"
        else
            @books = Book.all
            erb :'books/books'
        end
    end

    #Create
    get '/books/new' do
        if !logged_in?
            redirect "/login"
        else
            erb :'books/new'
        end
    end

    post '/books' do
        binding.pry
        if params[:title].empty? || params[:author].empty? || params[:page_count].empty? || params[:plot].empty? || params[:genre].empty?
            redirect "/books/new"
        else
            @book = Book.create(params)
            @book.member_id = current_member.id
            @book.save

            redirect "/books"
        end
    end

    #Read
    get '/books/:slug' do
        if logged_in?
            @book = Book.find_by_slug(params[:slug])
            erb :'books/show'
        else
            redirect "/login"
        end
    end

    #Update
    get '/books/:slug/edit' do
        @book = Book.find_by_slug(params[:slug])
        if logged_in? && @book && @book.member_id == current_member.id
            erb :'books/edit_book'
        else
            redirect '/login'
        end
    end

    patch '/books/:slug' do

    end

    #Delete
    delete '/books/:id/delete' do

    end


end