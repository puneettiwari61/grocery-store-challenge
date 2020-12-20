require_relative 'items_price'

class  PriceCalculator
    include ItemsPrice
    attr_reader :items

    def initialize
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.delete(" ").downcase.split(',')
        @total_sale_price = 0
        @total_actual_price =0
    end

    def show_invoice (item)
        name = item.name.capitalize
        quantity = item.quantity
        puts sprintf '%6s %8s %15s', name,quantity,"$#{get_sale_price(name,quantity).round(2)}"
        @total_sale_price +=  get_sale_price(name,quantity)
        @total_actual_price += get_actual_price(name,quantity)
    end



    def total_cost 
        puts "\nItem        Quantity       Price"
        puts "----------------------------------------"
        calculate_price.each { |item|  show_invoice(item)}
            
        puts "\nTotal price: $#{@total_sale_price.round(2)}"
        puts "You saved $#{(@total_actual_price - @total_sale_price).round(2)} today"

    end


end


user_purchase = PriceCalculator.new

user_purchase.total_cost