class  PriceCalculator
    def initialize
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.delete(" ").downcase.split(',')
        @total_sale_price = 0
        @total_actual_price =0
    end

end


user_purchase = PriceCalculator.new

