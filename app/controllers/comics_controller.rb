class ComicsController < ApplicationController
 before_action :set_comic, only: [:show, :edit, :update, :destroy]
 before_action :authorized, only: [:edit, :update, :destroy]
    def index
        @comics = Comic.all
    end

    def show
        # @comic = Comic.find(params[:id])
    end
    
    def new
        @comic = Comic.new
    end

    def create
        @comic = current_user.comics.build(comic_params)
        if @comic.save
            redirect_to comic_path(@comic)
        else
            render :new
        end
    end

    def edit
        # @comic = Comic.find(params[:id])
    end

    def update
    #    @comic = Comic.find(params[:id])
       @comic.update(comic_params) 
       redirect_to comic_path(@comic)
    end

    def destroy
        # @comic = Comic.find(params[:id])
        @comic.destroy
        redirect_to comics_path
    end

    private

    def comic_params
        params.require(:comic).permit(:title, :category, :published, :price)
    end
     
    def set_comic
        unless @comic = Comic.find_by_id(params[:id])
            flash[:message] = 'Comic not found'
            redirect_to comics_path
        end
    end

    def authorized
        if current_user != @comic.user
            flash[:message] = 'Not authorized to edit'
            redirect_to comics_path
        end
    end
end
