	require 'pry'
	# user chooses from a list of main dishes-- main menu/base class
	# user chooses 2 side dish items-- 
			# 2 side menus/ inheritance 2 classes / attr_access with ALL VALUES?
	# computer repeats users order--  
	# computer totals lunch items and displays total -
		 # hash with key and values?/ super?
	main_dish = {"Meatball Soup" => [3, 500], "Cheesy Gordita" => [4, 600], "Hamburger Surprise" => [5, 700]}
	side_dish = {"Mashed Taters" => [1, 600], "White rice" => [2, 700], "Baked Potatoe" => [3, 800]}
	dessert_menu = {"Cake" => [3, 300], "Pie" =>[3, 400]}
	main_dish_key = {'1' => "Meatball Soup", '2' => "Cheesy Gordita", '3' => "Hamburger Surprise"}

	class Menu
		attr_accessor :foods, :name
		def initialize (name, foods)
			@name = name
			@foods = foods
		end

		def display
			puts "*** #{@name} ***"
			i = 1 
			@foods.each do |food, info|
				puts "#{i}: #{food}: $#{info[0]} - #{info[1]} calories"
				i += 1
			end
		end
	
		def add(name, price, calories)
			@foods[name] = [price, calories]
		end
	end

	def welcome_menu
		puts "//Welcome to Burger Muffin//"
		@main_dish_menu.display
		puts "What would you like to order?"
		first_answer = gets.strip
		@side_dish_menu.display
		puts "What side dish would you like?"
		second_answer = gets.strip
		@desserts.display
		puts "What's for dessert?"
		third_answer = gets.strip
	end


	# puts main_dish_key[first_answer]



	# def display_order(main)
	# 	puts @main_dish =
	# end

	# def calculate
	# end




	@main_dish_menu = Menu.new("Supper", main_dish)
	@side_dish_menu = Menu.new("Sides", side_dish)
	@desserts = Menu.new("Dessert Menu", dessert_menu)

	# binding.pry

	welcome_menu
	# puts 0