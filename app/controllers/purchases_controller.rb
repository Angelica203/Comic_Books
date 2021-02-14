class PurchasesController < ApplicationController
    
    
    def new
        if params[:comic_id] && @comic = Comic.find_by_id(params[:comic_id]) 
            @purchase = @comic.purchases.build 
              else
             @purchase = Purchase.new
          end
    end

        # @comic = Comic.find_by_id(params[:comic_id]) 
        # @purchase = @comic.purchases.build(purchase_params)   


    def show
        @purchase = Purchase.find(params[:id])
    end
    
    def index
        @purchases = Purchase.all
    end


    def create
        @purchase = Purchase.new(purchase_params)
        if @purchase.save
            redirect_to purchase_path(@path)
        else
            render :new
        end
    end

    private

    def purchase_params
        # byebug
        params.require(:purchase).permit(:location, :purchase_total, :comic_id, :user_id)
    end
end