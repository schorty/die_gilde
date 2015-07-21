require 'require_all'
require_all '.'

module Helpers
  module Gui
    class Image < GuiElement
      def initialize(x, y, z, width, height, window, color: 0xbbbbbb)
        super(x, y, window)
        @image = Gosu::Image.new(Magick::Image.new(width, height) {
          self.background_color = '#bbbbbb'
        }, tileable: true)

        @image.draw(0,0,0)
      end

      def draw
        @image.draw(x, y, z)
      end
    end
  end
end
