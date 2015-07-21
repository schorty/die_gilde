require 'rmagick'
require 'pry'

module Helpers
  module Gui
    class ButtonFromText < Button
      def initialize(text, x, y, window, action: ->{}, font_color: nil, bg_color: 0xdfdfdf, border: nil)

        @text = text
        @bg_color_initial = bg_color

        @image_text = Gosu::Image.from_text(@window, @text, Gosu.default_font_name, 20)
        @height = @image_text.height + 10
        @width = @image_text.width + 40

        @fill = Magick::Image.new(@width, @height) {
          self.background_color = Helpers::ColorHelper::to_hex_color(bg_color)
        }

        super(x, y, width, height, window, action, font_color, bg_color, border)
        update
      end

      def update
        if @change
          color = Helpers::ColorHelper::to_hex_color(@bg_color)
          @fill = Magick::Image.new(@width, @height) {
            self.background_color = color
          }
          @change = false
        end

        @image_bg = Gosu::Image.new(@fill, tileable: true)
        @text_x_position = @x + (@width - @image_text.width) / 2
        @text_y_position = @y + (@height - @image_text.height) / 2 + 1
      end

      def draw
        @image_bg.draw(@x, @y, 0)
        @image_text.draw(@text_x_position, @text_y_position, 1, 1, 1, @font_color || Gosu::Color.argb(0xff_000000))
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
