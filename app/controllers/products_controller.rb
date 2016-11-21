class ProductsController < ApplicationController

  before_action :find_product, only: [:edit, :update, :destroy, :show]

  def index
    @products = Product.paginate(page: params[:page], per_page: 5)
  end

  def new
    @product = Product.new
    @categories = Category.all
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
    @categories = Category.all
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
      params.require(:product).permit(:name, :price, category_ids: [])
    end
end
