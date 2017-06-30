class BuyPointsController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(current_user.id)
	end

	def update
		#params.require(:user).permit(:points)
		@user = User.find(current_user.id)
		total_points = @user.points.to_i + params[:points].to_i
		@user.update_attributes(points: total_points)
		@user.save

		redirect_to "/"
	end
end
