class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        @product.save
        redirect_to products_path
    end

    def description
        find_product
        render plain: @product.description
    end

    def inventory
        find_product 
        if @product.inventory > 0
            render plain: "true"
        else 
            render plain: "false"
        end
    end
    private 
    def product_params
        params.require(:product).permit(:name, :description)
    end

    def find_product
        @product = Product.find(params[:id])
    end
end
