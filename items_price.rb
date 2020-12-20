module ItemsPrice


    def calculate_price
        items_hash  =  @items.inject(Hash.new(0)) do |a,c|       
            a[c] = a[c] + 1
            a
            end
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