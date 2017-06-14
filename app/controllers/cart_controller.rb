class CartController < ApplicationController
	before_action :authenticate_user!
	#before_action :authenticate_user!, :except => [:show, :index]
  def index
  	@carts = Cart.all
    @course_id = params[:id]


  end

  def new
    
  	@cart = Cart.new
    @course_id = params[:id]
    

   
  end

  def show
    @carts  = Cart.new
    @carts.user_id = current_user.id
    @carts.course_id= params[:id]
    @carts.quantity = 1
    @carts.save
    @cartsdos = Cart.find(params[:id])
  	@cartstodos = Cart.all
    @coursename = Course.joins(:carts).select('name')



    
  end
  def showdos
    @valuetoshow = params[:otherid]

  end


#session[:current_user_id] = @user.id
#current_user = User.find_by_id(session[:current_user_id])

  def create

   	#cart_params = params.require(:cart).permit(:quantity, :course_id, :user_id)
  	@carts  = Cart.new
    @carts.user_id = current_user.id
    @course_id = params[:id]
    @carts.quantity = 1
  	@carts.save
    @cartsdos = Cart.find(params[:id])
  end
end
