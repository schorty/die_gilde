module Models
  module Products
    class Silberring < Product
      def initialize
        @crafting_time = 240.freeze
        @value = 158.freeze
        @name = "Silberring".freeze
        @required_resources = [[1, Products::Eisen], [1, Products::Eisen]]
        @image_path = "images/products/eisen.png"
        # TODO: Silberring
      end
    end
  end
end
