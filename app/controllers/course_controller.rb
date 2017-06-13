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

  def show
  	@course = Course.find(params[:id])
  
  end


  def create
   	course_params = params.require(:course).permit(:name, :description, :category, :price)
  	@course = Course.new(course_params)
  	@course.save
  	redirect_to '/courses'

    
  end
end
