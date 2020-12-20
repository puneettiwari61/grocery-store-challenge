class  PriceCalculator
    def initialize
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.delete(" ").downcase.split(',')
        @total_sale_price = 0
        @total_actual_price =0
    end


    def calculate_price
        items_hash  =  @items.inject(Hash.new(0)) do |a,c|       
            a[c] = a[c] + 1
            a
            end
    end


    def total_cost 
        puts "\nItem        Quantity       Price"
        puts "----------------------------------------"

        calculate_price.each do |x, y|  
            x = x.capitalize
            puts sprintf '%6s %8s %15s', x,y,"$#{get_sale_price(x,y)}"
            @total_sale_price +=  get_sale_price(x,y)
            @total_actual_price += get_actual_price(x,y)
        end
            
        puts "\nTotal price: $#{@total_sale_price.round(2)}"
        puts "You saved $#{(@total_actual_price - @total_sale_price).round(2)} today"

    end


    def get_sale_price(x,y) 
        case x
        when "Milk"
            if y%2 == 0 
                y/2 * 5.00
            else 
             (y-1)/2 * 5.00 + 3.97
            end

        when "Bread"
            if y%3 == 0
               y/3 * 6.00
            else
              (y -  (y/3) * 3) * 2.17 + (y/3 * 6)
            end
        when "Banana"
            0.99 * y
        when "Apple"
            0.89 * y
        else 
            0
        end
    end


    def get_actual_price (x,y)

        case x
        when "Milk"
            y * 3.97

        when "Bread"
            y * 2.17

        when "Banana"
            y * 0.99 
            
        when "Apple"
            y * 0.89
        else 
            0
        end

    end

end


user_purchase = PriceCalculator.new

user_purchase.total_cost