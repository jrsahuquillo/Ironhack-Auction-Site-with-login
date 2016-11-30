class BidsController < ApplicationController

  def create
    email = params[:bid][:email]
    amount = params[:bid][:amount]
    @user = User.find_by(mail: email)
    @user_product = Product.find(params[:product_id])
  
    @bid = Bid.new(product_id: @user_product.id, user_id: @user.id, amount: amount)

    if @bid.save
      flash[:notice] = "Bid saved succesfully!"
    else
      flash[:alert] = "Error"
    end

    redirect_to(user_product_path(@user, @user_product))

  end

end
