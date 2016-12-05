class ProductsController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  # before_action :find_product, only: [:edit, :update, :destroy, :show]

  def index
    @products = Product.paginate(page: params[:page], per_page: 40).includes(:user, :categories).search_for(params[:search])
  end

  def new
    # @product = Product.new
    @categories = Category.all
  end

  def create
    # @product = Product.new(product_params)
    @product.user_id = current_user.id
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
    # session[:return_to] ||= request.referer
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

    # def find_product
    #   @product = Product.find(params[:id])
    # end

    def product_params
      params.require(:product).permit(:name, :price, :user_id, category_ids: [])
    end
end
