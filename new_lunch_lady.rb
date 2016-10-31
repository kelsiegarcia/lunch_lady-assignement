# how to start the project/sudo code
# go over classes and how to utilize them
#user/buyer


require 'pry'

class Buyer
	attr_accessor :dishes, :wallet

	def initialize
  	@dishes = []
  	# @wallet = 0
	end
end

class Dish
	attr_reader :name, :price, :calories

	def initialize(name, price, calories)
		@name = name
		@price = price
    @calories = calories
	end
end

class Lunch_lady
	attr_accessor :buyer

	def initialize
		@buyer = Buyer.new
	end

  def wallet
    puts "~*// Welcome to The Ruby Cafe //*~"
    puts "How much money do you have to spend?"
    @wallet = gets.strip.to_f
    pick_main_dish
  end

  def pick_main_dish
  	puts "What main dish would you like?
  		1: Hamburger(5.00)(1200cal)
  		2: Pizza(3.00)(1400cal)
  		3: Salad(1.00)(300cal)"
    case gets.strip
  	when '1'
  		buyer.dishes << Dish.new("Hamburger", 5.00, 1200)
  	when '2'
  		buyer.dishes << Dish.new("Pizza", 3.00, 1400)
  	when '3'
  		buyer.dishes << Dish.new("Salad", 1.00, 300)
  	else
  		puts "Bad selection. Choose 1-3"
  		pick_main_dish
  	end
  	pick_side_dish
  end

	def pick_side_dish
		puts "what side dish would you like?
			1: Funeral Potatoes(1.75)(200cal)
			2: Roll(1.00)(100cal)
			3: Nothing(.50)(150cal)"
		case gets.strip
		when '1'
			buyer.dishes << Dish.new('Funeral Potatoes', 1.75, 200)
		when '2'
			buyer.dishes << Dish.new('Roll', 1.00, 100)
		when '3'
			buyer.dishes << Dish.new('Nothing', 0.50, 150)
		else
			puts "Bad selection. Choose 1-3"
			pick_side_dish
		end
		more_sides
	end

	def more_sides
		puts "Would you like to order another side? Y/N"
		user_input = gets.strip.downcase
		if user_input == 'y'
			pick_side_dish
		elsif user_input == 'n'
			repeat_order
		else
			puts "That is not a valid option. Please say Y or N."
		end
	end

	def repeat_order
    @total = buyer.dishes.map(&:price).reduce(:+)
		puts "Your order consists of:"
		puts buyer.dishes.map(&:name).join(', ')
    puts "You wallet has: $#{'%.2f' % @wallet}"
	end

	def total_order
    if @total > @wallet
      puts "You don't have enough MULAH"
      wallet
    else
  		puts "Your order total is:"
      puts ('%.2f' % @total)
      puts "#{buyer.dishes.map(&:calories).reduce(:+)} calories"
    end
	end

	def process_buyer
    wallet
		total_order
  end
end

Lunch_lady.new.process_buyer
