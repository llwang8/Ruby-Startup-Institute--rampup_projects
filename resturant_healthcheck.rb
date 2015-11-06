#may have bugs, to be finalized 11/5/2015
 
#require "URI"
require "httparty"

class ResturantHealthCheck
   attr_accessor :zip, :rname, :response
   
	def initialize
	   input_zip
	   	@response = HTTParty.get( "https://data.cityofnewyork.us/resource/xx67-kt59.json" )
		  #response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json?zipcode=#{zip}")
		  #puts response.body
   		result = JSON.parse(response.body)
   		#puts result
   		
   		result.each do |resturant|
   			puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
   			puts resturant[:dba] if resturant[:zipcode] == zip
   		end
   		
   		input_name
   		
   		result.each do |resturant|
        	puts "----------------------------------------------"
    	 	#puts "Resturant: " + "MCDONALD'S"
    	 	puts "Resturant: " + rname
   	   		if resturant[:dba] == rname
   	    		puts "Street: " + resturant[:street] if resturant[:street] != nil 
   	      		puts "Health Grade: " + resturant[:score] if resturant[:score] != nil
   	      		puts "Violation Description: " + resturant[:violation_description]
   	      		puts "Date: " + resturant[:record_date]
   	   		end
   		end
	end

	def input_zip
	   puts "This is app to generate New York City Resturants Health Check report based on zipcode input by user."
	   puts "What area of resturants would you like to check?  Please type the zip code."
	   zip = gets.chomp.to_i
	   #zip = URI.escape(zip)
	   
	end
	
	def input_name
	   puts "What resturant would you like to check from the above list?"
	   @rname = gets.chomp.upcase
	end

end

ResturantHealthCheck.new
