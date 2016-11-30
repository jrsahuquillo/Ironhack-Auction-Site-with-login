class ProductsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_products = @user.products
  end

  def new
    @user = User.find(params[:user_id])
    @user_product = @user.products.new
  end

  def create
    @user = User.find(params[:user_id])
      @user_product = @user.products.new(product_params)

                            # (title: params[:product][:title],
                            # description: params[:product][:description],
                            # deadline: params[:product][:deadline])
                                #Changed by strong params! -> product_params

      if @user_product.save
        flash[:notice] = "New product added successfully"
        redirect_to user_products_path(@user)
        # redirect_to "/users/#{@user.id}/products"
      else
        render "new"
      end
  end

  def edit
    @user = User.find params[:user_id]
    @user_product = @user.products.find params[:id]
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @user_product = @user.products.find_by(id: params[:id])

    if @user_product.update(product_params)

                      # (title: params[:product][:title],
                      # description: params[:product][:description],
                      # deadline: params[:product][:deadline])
                          #Changed by strong params! -> product_params

      redirect_to "/users/#{@user.id}/products"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @user_product = @user.products.find_by(id: params[:id]).destroy
    redirect_to action: :index, user_id: @user.id
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @user_product = Product.find_by(id: params[:id])
    unless @user_product
      render 'No products found'
    end

  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :deadline)
  end

end
