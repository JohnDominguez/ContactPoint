class CourseController < ApplicationController
	before_action :authenticate_user!
	#before_action :authenticate_user!, :except => [:show, :index]
  def home
  	@courses = Course.all
  end

  def new
  	@course = Course.new
    @cart = Cart.new
  end

  def create
    course_params = params.require(:course).permit(:name, :description, :category, :price)
    @course = Course.new(course_params)
    @course.save
    redirect_to '/courses'
  end

  def show
  	@course = Course.find(params[:id])
  
  end

  def edit
    @course = Course.find(params[:id])


  end

  def update
    course_params = params.require(:course).permit(:name, :description, :category, :price)
    @course = Course.find(params[:id]).update(course_params)
    redirect_to '/courses'
   
  end

 # def destruir
 #     @course = Course.find(params[:id])
 #     @course = Course.find(params[:id])
 #     @cart = Cart.find_by(course_id: params[:id])
 #     @cart.destroy
 #     @course.destroy
 #     respond_to do |format|
 #     format.html { redirect_to "/courses", notice: 'Product was successfully destroyed.' }
 #     format.json { head :no_content }
 #   end
    
 # end


end
