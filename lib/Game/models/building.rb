class Building
  def initialize(employee_slots = 2, current_stock_slots = 3, stock_size = 2, tier = 1)
    @employee_slots = employee_slots
    @current_stock_slots = current_stock_slots
    @stock_size = stock_size
    @tier = tier
    @productions = []
    @stock = {}
  end

  def update
    @productions.each { |p| p.update }
  end

  def add_production(production)
    return false if @employee_slots <= @productions.size || !production.kind_of?(Production)

    @productions << production
  end

  def add_product_to_stock(product)
    if @stock[product]
      if @stock[product] < @stock_size
        @stock[product] += 1
        puts "Debug: Current Stock of #{product}: #{@stock[product]}"
        true
      else
        puts "Debug: Stock is full"
        false
      end
    elsif @stock.size < @current_stock_slots
      @stock[product] = 1
      puts "Debug: Current Stock of #{product}: #{@stock[product]}"
      true
    else
      puts "Debug: No slots available"
      false
    end
  end
end
