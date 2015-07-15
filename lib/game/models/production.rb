module Models
  class Production
    def initialize(building, product, duration, start = Time.now)
      @building = building
      @product = product
      @start = start.to_i
      @duration = duration
    end

    def update
      if finished?
        puts "Debug: Finished"
        if @building.add_product_to_stock(@product)
          @start = Time.now.to_i
          puts "Debug: Restartet #{@product.name} production"
        else
          puts "Debug waiting for slot to free up"
        end
      end
    end

    def finished?
      Time.now.to_i - @start > @duration
    end

    def remaining_duration
      return 0 if finished?
      @duration - (Time.now.to_i - @start)
    end

    def product
      @product
    end
  end
end
