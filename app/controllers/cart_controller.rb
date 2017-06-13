class CartController < ApplicationController
	before_action :authenticate_user!
	#before_action :authenticate_user!, :except => [:show, :index]
  def index
  	@carts = Cart.all
  end

  def new
  	@cart = Cart.new
    

   
  end

  def show
  	@cart  = Cart.find(params[:id])
    
  end

#session[:current_user_id] = @user.id
#current_user = User.find_by_id(session[:current_user_id])

  def create

   	cart_params = params.require(:cart).permit(:quantity, :course_id, :user_id)
  	@carts  = Cart.new(cart_params)
    @carts.user_id = current_user.id
  	@carts.save
  	redirect_to '/cart'
  end
end
