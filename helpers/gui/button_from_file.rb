require 'pry'

module Helpers
  module Gui
    class ButtonFromFile < Button
      def initialize(x, y, width, height, window, file, action: ->{}, bg_color: 0xdfdfdf, border: nil)
        super(x, y, window, action, font_color, bg_color, border)
        @image = Magick::Image.read(file) {
          self.background_color = Helpers::ColorHelper::to_hex_color(bg_color)
        }
        @width = @image.columns
        @height = @image.rows

        super(x, y, width, height, window, action, font_color, bg_color, border)
      end
    end
  end
end
