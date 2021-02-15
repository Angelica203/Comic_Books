class ComicsController < ApplicationController

    def index
        @comics = Comic.all
    end

    def show
        @comic = Comic.find(params[:id])
    end


    # def popular
   # end
    
    def new
        @comic = Comic.new
    end

    # def create
    #     @comic = Comic.new(comic_params)
    #     if @comic.save
    #     redirect_to comic_path(@comic)
    #     else
    #         render :new
    #     end
    # end

    def create
        @comic = current_user.comics.build(comic_params)
        # @comic = @purchase.comics.build(comic_params)
        # @comic.user = current_user
        if @comic.save
            redirect_to comic_path(@comic)
        else
            render :new
        end
    end

    def edit
        @comic = Comic.find(params[:id])
    end

    def update
       @comic = Comic.find(params[:id])
       @comic.update(comic_params) 
       redirect_to comic_path(@comic)
    end

    def destroy
        
        @comic = Comic.find(params[:id])
        @comic.destroy
        redirect_to comics_path
    end

    private

    def comic_params
        params[:comic][:price_confirmation] = params[:comic][:price_confirmation].to_f 
        params.require(:comic).permit(:title, :category, :published, :price, purchase_attributes: [:location, :purchase_total])
    end
    
end
