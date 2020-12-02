class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
        
        if @tweet.save
            flash[:notice] = '投稿'
            redirect_to tweets_path
        else
            render :new
        end
    end
    
    def show
        @tweet = Tweet.find(params[:id])
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        flash[:notice] = '削除しました'
        redirect_to '/'
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        @tweet.message = params[:tweet][:message]
        
        if @tweet.save
            flash[:notice] = '更新'
            redirect_to '/'
        else
            render 'edit'
        end
    end
end