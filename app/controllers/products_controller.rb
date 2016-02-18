class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :show, :destroy]
   
    def index
        @product = Product.paginate(page: params[:page], per_page: 8)
    end
    

    
    def new
        @product = Product.new
    end
    
    def show
    end
    
    def edit
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:success] = "Succes create #{@product.name}"
            redirect_to product_path(@product)
        else
            render 'new'
        end
    end
    
    def update
        if @product.update(product_params)
            flash[:success] = "Product was successfully updated"
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end
    
    
    def destroy
        @product.destroy
        flash[:danger] = "Product was successfully deleted"
        redirect_to products_path
    end

private

    def product_params
        params.require(:product).permit(:name, :description, :count_in_stock, :price)
    end
    
    def set_product
        @product = Product.find(params[:id])
    end

end