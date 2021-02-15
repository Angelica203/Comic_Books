class PurchasesController < ApplicationController
    
    

    def new
        if params[:comic_id] && @comic = Comic.find_by_id(params[:comic_id])
          @purchase = @comic.purchases.build
        else
          redirect_to root_path, alert: "comic not found"
        end
      end    

    def show
        @purchase = Purchase.find_by_id(params[:id])
    end
    
    def index
        @purchases = Purchase.all
    end


    # def create
    #     @purchase = Purchase.new(purchase_params)
    #     if @purchase.save
    #         redirect_to purchase_path(@path)
    #     else
    #         render :new
    #     end
    # end
    def create
        @comic = Comic.find_by_id(params[:comic_id])
        @purchase = @comic.purchases.build(purchase_params)
        @purchase.user = current_user
        if @purchase.save
          redirect_to purchase_path(@purchase)
        else
          render :new
        end
      end
    


    private

    def purchase_params
        # byebug
        params.require(:purchase).permit(:location, :purchase_total)
    end
end