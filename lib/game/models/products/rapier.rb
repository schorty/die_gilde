module Models
  module Products
    class Rapier < Product
      def initialize
        @crafting_time = 360.freeze
        @value = 338.freeze
        @name = "Rapier".freeze
        @required_resources = [[2, Products::Eisen], [1, Products::Beschlag]]
        @image_path = "images/products/rapier.png"
      end
    end
  end
end
