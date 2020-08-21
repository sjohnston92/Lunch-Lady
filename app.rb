
require_relative "lunch"

@main_dishes = [Dish.new('McNasty',1.99 ), Dish.new("McDouble", 0.99),]
@side_dishes = [Dish.new('Fries ', 0.99), Dish.new("Mcflurry", 2.09),]
@order = []


def print_menu(x) 

  x.each_with_index do |dish, index|
  puts "#{index + 1}) #{dish.name} Price: #{dish.price}"
  end

end

def start_order
order_main
order_side
order_side
checkout
total
end

def order_main
  print_menu(@main_dishes)
  select_dish(@main_dishes)
end

def select_dish(x)
  current_order={}
  puts "Please Select a Dish"
  dish_index = gets.chomp.to_i
  current_order[:name] = "#{x[dish_index-1].name}"
  current_order[:price] = "#{x[dish_index-1].price}"
 
  @order << current_order

end

def order_side
  print_menu(@side_dishes)
  select_dish(@side_dishes)
end

def checkout
  puts "You are purchasing: "
  @order.each do |order|
      puts "#{order[:name]}      Price: #{order[:price]}"
  end
end


def total
  totalprice = 0.0
  @order.each do |order|
      totalprice += order[:price].to_f
  end
  puts "The total price is:     $#{totalprice}"
end

start_order
