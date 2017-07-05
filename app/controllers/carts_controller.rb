class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    @sum = 0
    @quantity = 0
    @carts.each do |cart|
      @sum += cart.course.price
      @quantity += cart.quantity
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new
    @cart.user_id = current_user.id
    @cart.course_id = params[:course_id]
    @cart.quantity = 1

    respond_to do |format|
      if @cart.save
        format.html { redirect_to "/carts", notice: 'Agregado al carrito' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end   
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def success

  end

  def destroy_cart
    
    @user = User.find(current_user.id)
    @total = params[:total].to_i
    @user_points = current_user.points
    @carts = Cart.all
    
    if @user_points >= @total
      @user.update_attribute(:points, @user_points - @total)
      
      @carts.each do |cart|
        cart.destroy
      end
      redirect_to "/success"
    else
      redirect_to "/buy_points/buy", notice: "No tienes los puntos suficientes"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :course_id, :quantity)
    end
end
