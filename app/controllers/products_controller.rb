class ProductsController < ApplicationController

  before_filter :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.paginate(page: params[:page], per_page: 3)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added." 
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = "Product successfully updated."
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product successfully deleted."
    redirect_to products_path
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
