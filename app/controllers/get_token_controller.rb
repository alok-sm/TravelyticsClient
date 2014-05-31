require 'net/http'
class GetTokenController < ApplicationController
	def index
		appid = "1408221636130524"
		appsecret = "fe78228de0d214b0117cd2cd3cae645e"
		callbackurl = "http://localhost:3000/callback"
		$oauth = Koala::Facebook::OAuth.new(appid, appsecret, callbackurl)

		redirect_to $oauth.url_for_oauth_code(
			:permissions => "user_about_me,user_likes,user_interests,user_friends"
		)
	end

	def callback
		sd=Seat.all.first.attributes
		sd.shift
		@code = $oauth.get_access_token(params[:code])
		#raise 'alok'
		uri = URI('http://localhost:4000/api')
		res = Net::HTTP.post_form(uri,:user_token => @code,:seat_data => sd.to_json,:adjacency_data => $adjacency_data.to_json)
	    @response=res.body	
	end	
end
