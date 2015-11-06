#Misc ruby exercises
#celsius_fahrenheit and fahrenheit_celsius
#deaf_grandma
#leap_year
#fizz_buzz
#bottle_of_beer
#guess_number
#firestation_NYC
#misc. ruby exercises

def celsius_fahrenheit (c_temp)
	f = c_temp * 9 / 5 + 32
    puts "The temperature in fahrenheitis " + f.to_s 
	return f
end

def fahrenheit_celsius (f_temp)
	c = (f_temp - 32)*5/9
    puts  "The temperature in celsius is " + c.to_s 
    return c
end

def input_celsius_fahrenheit
	puts "What is the temperature in celsius?"
	answer = gets.chomp
	f = answer.to_i * 9 / 5 + 32
    puts "The temperature in fahrenheit is " + f.to_s 
	return f
end

def input_fahrenheit_celsius

	puts "What is the temperature in fahrenheit?"
	answer = gets.chomp
	c = (answer.to_i - 32)*5/9
    puts  "The temperature in celsius is " + c.to_s
	return c
end

celsius_fahrenheit (100)
fahrenheit_celsius (86)
input_celsius_fahrenheit
input_fahrenheit_celsius

def deaf_grandma_1
	num = 9
	while num >0
		year = rand(1930..1980) #1930 and 1980 inclusive
		puts "Can't stop talking to Grandma,  What do you say to Grandma?"
		answer = gets.chomp

		if answer== "BYE" 
			puts "BYE, SONNY!"
			break
		else
			(answer == answer.upcase)? (puts "NO, NOT SINCE #{year}!"):(puts "HUH?!, SPEAK UP SONNY!")
		end
	end
end

deaf_grandma_1

def deaf_Grandma_2
	num = 9
	numBYE = 0

	while num >0
		year = rand(1930..1980)
		puts "Can't stop talking to Grandma,  What do you say to Grandma?"
		answer = gets.chomp

		if answer != "BYE"
			(answer == answer.upcase)?(puts "NO, NOT SINCE #{year}!"):(puts "HUH?!, SPEAK UP SONNY!")
			numBYE = 0	
		else
			numBYE +=1
			puts "numBYE = #{numBYE}"
			if numBYE == 3
				puts "BYE, SONNY!"
				break
			end
		end
	end
end

deaf_Grandma_2

def leap_year
	puts "starting year for the leap year range?"
	y1=gets.chomp.to_i
	puts"ending year for the leap year range?"
	y2=gets.chomp.to_i

	leapyear=Array.new
	year=y1
	while year <= y2
		(year%100 == 0)?(leapyear.push(year) if year%400==0):(leapyear.push(year) if year%4==0)
		year +=1
	end
end

leapyear_collect=leap_year
leapyear_collect.each do |yr|
	puts yr
end

def fizzbuzz 
	n = 0
	while n < 101
		(n%3 == 0) ? ((n%5 == 0) ? (puts 'fizzbuzz') : (puts 'fizz')) : ((n%5 == 0) ? (puts 'buzz') : (puts n))
		n += 1
	end
end

fizzbuzz

def bottle_of_beer_lyrics
	puts "lyrics of the song 99 Bottles of Beer"

	num =99

	while num > 0
		def num_bottle_phrase (n)
			((n == 0)||(n == 1))? (phrase ="#{n} bottle"):(phrase="#{n} bottles")
		end

		puts "#{num_bottle_phrase(num)} of beer on the wall, ##{num_bottle_phrase(num)} of beer."
		puts "Take one down and pass it around, #{num_bottle_phrase(num-1)} of beer on the wall.\n\n"
		
		num -= 1
	end
	last_bottle
end

def last_bottle
 		puts "No more bottles of beer on the wall, no more bottles of beer."
		puts "Go to store and buy some more, 99 bottles of beer on the wall.\n\n"
end

bottle_of_beer_lyrics

def guess_number
	target = rand (100)

	while (n <= 5) && ( )
		puts "Guess a number between 1 and 100. You have 5 chances."
		guess = gets.chomp.to_i

		((guess - target) > 0)? (highlow = "higher") : (highlow = "lower")

		if guess != target
			puts "Sorry, Your answer is #{highlow} than the answer.  You can try again.  You have #{5-n} chance left."
		else
			puts "Congratulation!  Right on target!"
		end
		number += 1
	end
end

guess_number

require "httparty"

class FireStation
   def initialize 
       response = HTTParty.get( "https://data.cityofnewyork.us/resource/hc8x-tcnd.json" )
       #if response.success?
          puts response.body 
       #else
          #raise response.response
       #end
   end
end

FireStation.new






#ruby exercises at rampup
def say_hello 
	puts "what is your name?"
	answer =gets.chomp
	puts "what is your last name?" 
	answer2= gets.chomp
	puts "hello #{answer} #{answer2}"
	puts 'hello #{answer} #{answer2}'
end
say_hello 


def mad_lib
	puts "What is a verb on your mind now?"
	answerV = gets.chomp
	puts "provide a noun please?"
	answerN = gets.chomp
	puts "provide an adjective please?"
	answerA = gets.chomp
	puts  "A line: " + answerV + " as if the sky is dropping " + answerA + " " + answerN
	puts "B line: #{answerV} as if the sky is dropping #{answerA} #{answerN}"
end
mad_lib


def report_birthY
	puts "What is your name?"
	answer1 = gets.chomp
	puts "What is your age?"
	answer2 = gets.chomp.to_i
#	answer2 = answer2.to_i
	puts " A: #{answer1} was born in #{2015 - answer2}"
	puts " B: " + answer1 + " was born in " + (2015-answer2).to_s
end
report_birthY


gold_current_price_per_ounce = 1336

def price_of_gold_from_ounces (gold_ounces)
#	gold_price = gold_ounces * gold_current_price_per_ounce
	gold_price = gold_ounces * 1336
end

def price_of_gold_from_pounds (gold_pounds)
	gold_ounces = gold_pounds * 16
	gold_price = price_of_gold_from_ounces(gold_ounces)
end

def price_of_gold_from_kilograms (gold_kilograms)
	gold_ounces = 35.274*gold_kilograms
	gold_price = price_of_gold_from_ounces (gold_ounces)
end

puts  "100 pounds of gold worth $#{price_of_gold_from_pounds(100)}"
puts  "200 kilograms of gold worth $#{price_of_gold_from_kilograms(200)}"


def story_game
	puts “You’re a traveler on a long journey. After many miles, you come to a fork in the road. To the North is a small village.  To the East is dark cave. Which way do you go? North or East?”
	direction =gets.chomp.lowercase
	if direction == "north" 
		puts "going to small village"
	elsif direction == "east"
		puts "going to a dark cave"
	else
		puts "no where is leading"
	end
end
