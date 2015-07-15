module Models
  module Products
    class Eisen < Product
      def initialize
        @crafting_time = 10.freeze
        @value = 20.freeze
        @name = "Eisen".freeze
        @required_resources = []
        @image_path = "images/products/eisen.png"
      end
    end
  end
end
