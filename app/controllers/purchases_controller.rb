class PurchasesController < ApplicationController
    
    
    def new
        @comic = Comic.find_by_id(params[:comic_id]) 
        @purchase= @ comic.purchases.build(purchase_params)   
    end

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

    def purchase_parmas
        params.require(:purchase).permit(:location, :purchase_total)
    end
end
