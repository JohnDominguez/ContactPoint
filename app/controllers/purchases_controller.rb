class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
   @carts = Cart.where(user_id: current_user.id)
    
    @carts.each do |cart|
      @purchase = Purchase.new
      @purchase.user_id = current_user.id
      nuevo = @purchase.cart_id.to_s.dup.to_i
      @purchase.course_id = cart.course_id
      nuevo = cart.id
      @purchase.save
    end

    @carts = Cart.all
    @user = User.find(current_user.id)
    @total = params[:total].to_i
    @user_points = current_user.points
    
    if @user_points >= @total

      @user.update_attribute(:points, @user_points - @total)
      
      @carts.each do |cart|
        cart.destroy
      end
      redirect_to "/success"
    else
      redirect_to "/buy_points/buy", notice: "Lo siento, tus puntos no son suficientes para realizar la compra. :'("
    end
  end

  def purchase
    
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      # => params.require(:purchase).permit(:user_id, :course_id, :quantity, :price, :cart_id)
    end
end
