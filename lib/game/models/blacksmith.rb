module Models
  class Blacksmith < ProductionBuilding
    POSSIBLE_PRODUCTS = [Products::Rapier, Products::Silberring, Products::Beschlag]

    def initialize(employee_slots = 2, current_stock_slots = 3, stock_size = 2, tier = 1)
      super

      @loading_bar = Gui::LoadingBar.new(50,@height - 40,200,20,self)
      @buttons = []
      @buttons << Gui::Button.new("Neue Produktion", 100, 100, 150, 30, self, action: ->{
        @buildings.first.add_production(Models::Production.new(@buildings.first, Models::Products::Rapier, 2, Time.now))
      })
    end

    def update

    end

    def draw
    end
  end
end
