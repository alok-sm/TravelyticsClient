class LastController < ApplicationController
	def index
			Seat.reserve_seat(params[:seatno],params[:token])
	end	
end
