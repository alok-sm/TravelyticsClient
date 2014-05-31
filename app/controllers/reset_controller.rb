class ResetController < ApplicationController
	def index
		Seat.reset

		render json:"done"
	end
end