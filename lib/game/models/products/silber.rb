module Models
  module Products
    class Silber < Product
      def initialize
        @crafting_time = 10.freeze
        @value = 38.freeze
        @name = "Silber".freeze
        @required_resources = []
        @image_path = "images/products/silber.png"
      end
    end
  end
end
