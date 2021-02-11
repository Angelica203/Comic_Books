class PurchasesController < ApplicationController
    
    
    def new
    @purchase = Purchase.new
    end

    def show
        @purchase = Purchase.find(id: params[:id])
    end
    
    def index
        @purchases = Purchase.all
    end


    def create
        @purchase = Purchase.new(purchase_parmas)
        if @purchsas.save
            redirect_to purchase_path(@path)
        else
            render :new
    end

    private

    def purchase_parmas
        params.require(:purchase).permit(:item, :amount_paid)
    end
end
