class WithoutFbController < ApplicationController
	def index
		sd=Seat.all.first.attributes
		sd.shift
		@response = {}
		sd.each do |k,v|
			if v["occupied"] == true
				@response[k] = -1
			else
				@response[k] = 0
			end
		end
	end	
end
