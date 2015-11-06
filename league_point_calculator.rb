
class Team
	attr_accessor :name, :point
	def initialize(vname, vpoint)
		@name = vname
		@point = vpoint
	end
end

class League_point_calculator
	attr_accessor :teams
	
	def initialize
		@teams = []
		user_input
	end

	def in_team(team_name)
		target_team =""
			if !teams.find {|t| t.name == team_name}
				teams << Team.new(team_name, 0)
				target_team = teams.last				
			else
				target_team = teams.find {|t| t.name == team_name}
			end
	end

	def add_point
		team_score = []
	
		puts "please enter team match final scores with SPACE ONLY between words and numbers like this: Yankees 5 Mets 4."
		team_score = gets.chomp.split(" ")

		teamA = in_team(team_score[0])
		teamB = in_team(team_score[2])

		puts teamA
		puts teamB

		if team_score[1].to_i > team_score[3].to_i
			teamA.point +=3 
		elsif team_score [1].to_i < team_score[3].to_i	
			teamB.point +=3 
		else
			teamA.point +=1 
			teamB.point +=1
		end		
	end

	def output_ranking

		teams.map do |t|
			puts "#{t.name} #{t.point}"
		end

		#teams = teams.find(:all)
		teams.sort_by! {|x,y| (y.point != x.point) ? (y.point <=> x.point) : (x.name <=> y.name)}

		puts "==================================="
		puts "Team ranking from highes to lowerest:"
		teams.map do |t|
			puts "#{t.name} #{t.point}"
		end
		puts "==================================="		
	end

	def user_input
		choice = ""
		puts "This is an app to calculate league ranking based on points."
		puts "What would you like to do? Enter \n1 to input team score, or \n2 to output league ranking based on points, or \n3 to exit."
		choice = gets.chomp
		while choice != "3"
			if choice == "1"
				add_point
			else
				output_ranking
			end
			puts "What would you like to do next? Enter \n1 to input team score, or \n2 to output league ranking based on points, or \n3 to exit."
			choice = gets.chomp	
		end
		puts "This is the final league ranking."
		output_ranking
	end
end

League_point_calculator.new
