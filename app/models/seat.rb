class Seat
  include Mongoid::Document
  def self.reset
  	i=1
		Seat.delete_all
		sd={}
		while i<=40  do
			sd[('s'+i.to_s).to_sym]={:occupied => false}
			i+=1
		end
		Seat.new(sd).save
  end
  def self.reserve_seat(sid,token=nil)
  	sd=Seat.all.first.attributes
    
    # raise 'alok'
  	Seat.delete_all
  	 if !token.nil?
  		sd[sid.to_sym]={
  			:occupied => true,
  			:fb => token
  		}
	   else
	     sd[sid.to_sym]={
  			:occupied => true
  		  }	
  	 end
  	Seat.new(sd).save	
  end	
end
