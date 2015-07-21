require 'rmagick'
require 'pry'

module Helpers
  module Gui
    class Button < GuiElement
      def initialize(x, y, width, height, window, action: ->{}, font_color: nil, bg_color: 0xdfdfdf, border: nil)
        super(x, y, window)

        @name = name
        @font_color = font_color
        @bg_color = bg_color
        @bg_color_initial = bg_color
        @border = border
        @action = action
      end

      def update; end

      def draw; end

      def clicked?(x, y)
        x <= @x + @width && x >= @x && y <= @y + @width && y >= @y
      end

      def down
        @bg_color -= 0x202020
        if @bg_color < 0
          @bg_color = 0
        end
        @change = true

        update
      end

      def up
        @change = true
        @bg_color = @bg_color_initial

        update
        @action.call
      end
    end
  end
end
