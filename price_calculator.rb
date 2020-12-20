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

    def show_invoice (x,y)
        x = x.capitalize
        puts sprintf '%6s %8s %15s', x,y,"$#{get_sale_price(x,y)}"
        @total_sale_price +=  get_sale_price(x,y)
        @total_actual_price += get_actual_price(x,y)
    end


    def total_cost 
        puts "\nItem        Quantity       Price"
        puts "----------------------------------------"

        calculate_price.each { |x, y|  show_invoice(x,y)}
            
        puts "\nTotal price: $#{@total_sale_price.round(2)}"
        puts "You saved $#{(@total_actual_price - @total_sale_price).round(2)} today"

    end


end


user_purchase = PriceCalculator.new

user_purchase.total_cost