class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:edit, :update, :destroy]
  

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
      if params[:comic_id] && @comic = Comic.find_by_id(params[:comic_id])
        @purchases = @comic.purchases
      else
        @purchases = current_user.purchases
    end
  end

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

      def edit

      end

      def update
        @purchase.update(purchase_params) 
        redirect_to purchase_path(@purchase)
 
      end

      def destroy
        @purchase.destroy
        redirect_to purchases_path
      end
    


    private

    def purchase_params
        # byebug
        params.require(:purchase).permit(:location, :purchase_total)
    end

    def set_purchase
      @purchase = Purchase.find_by_id(params[:id])
    end

    def authorized
      if current_user != @purchase.user
        flash[:message] = 'Not authorized to edit'
        redirect_to new_comic_purchase_path
        end
      end
end