module Models
  module Products
    class Beschlag < Product
      def initialize
        @crafting_time = 40.freeze
        @value = 105.freeze
        @name = "Beschlag".freeze
        @required_resources = [[1, Products::Eisen]]
        @image_path = "images/products/beschlag.png"
      end
    end
  end
end
