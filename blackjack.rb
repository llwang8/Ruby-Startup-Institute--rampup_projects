#may have bugs, to be finalize 11/5/2015

#first version of blackjack game
#future version to include the following features:
###ace points 1 and 11
###multiple players + dealer settlement
###splitting pairs
###doubling down
###insurance


module CardsOperation
	def deal (deck)
		deck.shuffle.pop << self.hand
	end
	def cards_count(hand)
		hand.each {|i| sum += i}
	end
end

class Dealer
	include CardsOperation
	attr_accessor :name, :hand, :win, :bankroll
	def initialize
		@name = "dealer"
		@hand = []
		@win = false
		@bankroll=0	
	end
end

class Player
	include CardsOperation
	attr_accessor :name, :hand, :win, :bet, :bankroll
	def initialize
		puts "what is your name, blackjack player?"
		@name=gets.chomp.capitalize
		@hand = []
		@win = false
		@bet = 0
		@bankroll = 0		
	end
end

class Blackjack
	attr_accessor :cards, :player, :dealer, :answer
	def initialize 
		#cards_name=['A','2','3','4','5','6','7','8','9','10','J','Q','K','A','2','3','4','5','6','7','8','9','10','J','Q','K','A','2','3','4','5','6','7','8','9','10','J','Q','K','A','2','3','4','5','6','7','8','9','10','J','Q','K']
		@cards=[1,2,3,4,5,6,7,8,9,10,10,10,10,1,2,3,4,5,6,7,8,9,10,10,10,10,1,2,3,4,5,6,7,8,9,10,10,10,10,1,2,3,4,5,6,7,8,9,10,10,10,10]
		#while i<53
			#@hash={cards_name[i]=> cards[i]}
			#i+=1
		#end
		@dealer = Dealer.new
		@player = Player.new
		@answer = ""

		do
			puts "#{player.name}, how much money do you put down for Blackjack today? Or type exit to stop playing." #establish player bank
			answer = gets.chomp
		end while (answer != "exit") && !check_integer_input(answer)
		play
	end

	def hit_or_stay
		puts "Do you want to hit ('h' for hit) or stay ('s' for stay)?"
		get.chomp
	end

	def game_over
		if dealer.win
			player.bankroll -= player.bet
			dealer.bankroll += player.bet
			puts "#{dealer.name} won #{player.bet}"
			another_round
		end
		if player.win
			player.bankroll += player.bet
			dealer.bankroll -= player.bet
			puts("#{player.name} won #{player.bet}")
			another_round
		end
	end

	def bankroll_balance
		if player.bankroll == 0
			puts "#{player.name}, your bank balance is zero. Do you want to add some more money? y or n"
			if gets.chomp == "y"
				puts "how much do you want to put to your bank?"
				player.bankroll == gets.chomp.to_i
				return true
			else
				puts "Come back some other time."
				return false
			end
		else
			return true
		end
	end

	def another_round 
		puts "#{player.name}, do you want to play another round? answer y or no"
		choice=gets.chomp.lowercase
		if choice == "y" && bankroll_balance
			dealer.win ='false'
			player.win ='false'
			dealer.hand = []
			player.hand = []
			player.bet = 0
			play
		else
			puts "Ok,  see you next time!"
		end
	end
	def check_integer_input(user_input)
		user_input.to_i.to_s == user_input
	end
	def play
		begin
			puts "#{player.name}, what is your bet for this round of game? Enter a number or type exit to stop playing."
			answer = gets.chomp
			player.bet = answer.to_i
			puts "Your bet is bigger than your bank balance.  Please place a different bet." if (player.bankroll < player.bet) 
		end while (answer != "exit") && ((!check_integer_input(answer)) || (player.bankroll < player.bet))

		while answer != "exit" && (player.bankroll >= player.bet)
			player.deal(cards) 			#first round of deal cards
			puts "#{player.name}, your card is #{player.hand}."
			dealer.deal(cards) 
			puts "Dealer's cards is #{dealer.hand}."

			player.deal(cards)		#second round of deal cards, @dealer 2nd card not shown
			puts "#{player.name}, your cards are #{player.hand}."
			dealer.deal(cards)

			while cards_count(player.hand) < 21 && hit_or_stay == "h"
				player.deal(cards)	
				puts "#{player.name}, your card is #{player.hand.last}."
			end

			while cards_count(player.hand) < 21 && cards_count(dealer.hand) < 17 
				player.deal(cards)
			end
			game_over
		end
	end
end

Blackjack.new
