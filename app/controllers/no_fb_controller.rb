class NoFbController < ApplicationController
	def index
			Seat.reserve_seat(params[:seatno])
			render json:done
	end	
end
