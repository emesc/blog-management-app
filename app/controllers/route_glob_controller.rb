class RouteGlobController < ApplicationController
  def index
    # # returns params
    # render text: params.inspect
    # # returns the absolute path
    # render text: request.url
    @product = Product.where("name LIKE ?", "%#{params[:path]}%").first
    if @product
      redirect_to product_path(@product)
    else
      flash[:notice] = "You may use the search form instead"
      redirect_to products_path
    end
  end
end
