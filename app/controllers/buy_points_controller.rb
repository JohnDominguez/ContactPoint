class BuyPointsController < ApplicationController
	# before_action: :user_signded_in?

# 	def index
# 		@user = User.find(current_user.id)
			
# 	end

# 	def edit
# 		@user = User.find(current_user.id).update(points: params[:points])


# 	end

# 	def create

# 	  #user_params = params.require(:user).permit(:points)
# 	 	@user = User.find(current_user.id).update(points: params[:point])
# 	 	@user.save
	 	
# 	 	redirect_to '/buy_points/show'
#   end
	
# 	def show
# 		@user = User.find(current_user.id)
# 	end
# end
