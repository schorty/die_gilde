require 'rmagick'
require 'pry'

module Gui
  class Button < GuiElement
    def initialize(name, x, y, width, height, window, action: ->{}, font_color: nil, bg_color: 0xdfdfdf, border: nil)
      super(x, y, width, height, window)

      @name = name
      @font_color = font_color
      @bg_color = bg_color
      @bg_color_initial = bg_color
      @border = border
      @action = action

      @fill = Magick::Image.new(@width, @height) {
        self.background_color = Utils::ColorHelper::to_hex_color(bg_color)
      }
      @image_text = Gosu::Image.from_text(@window, @name, Gosu.default_font_name, 20)

      update
    end

    def update
      if @change
        color = Utils::ColorHelper::to_hex_color(@bg_color)
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
