class Suspect
	attr_accessor :name, :gender, :skin, :hair, :eye
	def initialize(vname, vgender, vskin, vhair, veye)
		@name=vname
		@gender=vgender
		@skin=vskin
		@hair=vhair
		@eye=veye
	end
end

class Guess_who
	attr_reader :suspects, :guilty 
	attr_accessor :Guess, :attribute, :attribute_value, :name

	def initilize
		create_suspects
		@guilty = suspects.shuffle.pop
		@attribute = ""
		@attribute_value = ""
		@name = ""
		@guess = false

		play_game
	end

	private
	def create_suspects
		@suspects=[]
		suspects << Suspect.new("Rachel","Girl","Black","Auburn","Brown")
        suspects << Suspect.new("Mac","Boy","White","Black","Brown")
        suspects << Suspect.new("Nick","Boy","White","Brown","Blue")
        suspects << Suspect.new("Angie","Girl","White","Auburn","Green")
        suspects << Suspect.new("Theo","Boy","White","Blonde","Brown")
        suspects << Suspect.new("Joshua","Boy","White","Black","Brown")
        suspects << Suspect.new("Emily","Girl","White","Blonde","Blue")
        suspects << Suspect.new("Jason","Boy","White","Blonde","Green")
        suspects << Suspect.new("John","Boy","White","Brown","Blue")
        suspects << Suspect.new("Grace","Girl","Black","Black","Brown")
        suspects << Suspect.new("Jake","Boy","White","Brown","Brown")
        suspects << Suspect.new("Megan","Girl","White","Blonde","Green")
        suspects << Suspect.new("Ryan","Boy","White","Auburn","Brown")
        suspects << Suspect.new("Brandon","Boy","White","Blonde","Brown")
        suspects << Suspect.new("Beth","Girl","White","Blonde","Brown")
        suspects << Suspect.new("Diane","Girl","Black","Brown","Brown")
        suspects << Suspect.new("Chris","Boy","White","Black","Green")
        suspects << Suspect.new("David","Boy","Black","Black","Brown")
        suspects << Suspect.new("Michelle","Girl","Black","Brown","Brown")
        suspects << Suspect.new("Tyson","Boy","Black","Black","Brown")
        suspects << Suspect.new("Ursula","Girl","White","Auburn","Green")
	end

	def user_input
		puts "What attribute of suspect you want to make a guess? \nYou can type gender, hair, skin, eye."
		attribute = gets.chomp.downcase
		puts "What value is your guess's #{attribute}?"
		attribute_value = get.chomp.capitalize
	end

	def user_input_name
		puts "What is your guess of guilty name?"
		name = gets.chomp.capitalize
	end

	def show_suspects
		puts "Here are the suspects list."
		puts "------------------------------"
		suspects.map do |i|
			puts "Suspect #{i+1} #{i.name}"			
			#puts "Name is #{}{susects[i].name}"
			#puts "Skin color is #{suspects[i].skin}"
			#puts "hair color is #{suspects[i].hair}"
			#puts "Eye color is #{suspects[i].eye}"
		end
		puts "------------------------------"
	end

	def update_suspects
		case attribute
			when "gender"
				if guilty.gender ==attribute_value
					suspects.keep_if {|s| s.gender == attribute_value}
					puts "The guilty one's gender is #{attribute_value}"
				else
					suspects.reject! {|s| s.genger == attribute_value}
					puts "The guilty one's gender is not #{attribute_value}"
				end
			when "skin"
				if guilty.skin ==attribute_value
					suspects.keep_if {|s| s.skin == attribute_value}
					puts "The guilty one's skin color is #{attribute_value}"
				else
					suspects.rejectif! {|s| s.skin == attribute_value}
					puts "The guilty one's skin color is not #{attribute_value}"
				end
			when "hair"
				if guilty.hair ==attribute_value
					suspects.keep_if {|s| s.hair == attribute_value}
					puts "The guilty one's hair color is #{attribute_value}"
				else
					suspects.rejectif! {|s| s.skin == attribute_value}
					puts "The guilty one's skin color is not #{attribute_value}"
				end
			when "eye"
				if guilty.eye ==attribute_value
					suspects.keep_if {|s| s.eye == attribute_value}
					puts "The guilty one's eye is #{attribute_value}"
				else
					suspects.reject! {|s| s.eye == attribute_value}
					puts "The guilty one's eye color is not #{attribute_value}"				
				end
			end
	end

	def play_game
		puts "Welcome to the game of Guess Who!  You have 3 chance to find the guilty."

		3.times do
			show_suspects
			user_input
			update_suspects
			show_suspects
			match_name(user_input_name)
			
			if guilty.name == name
				guess=true
				break
			end
		end
		puts "------------------------------"
		guess ? (puts "You won. #{guilty.name} is the guilty one.") : (puts "Sorry, you ran out of your chance and did not win. #{guilty.name} is the guilty one.")
		puts "------------------------------"
	end
end

Guess_who.new
