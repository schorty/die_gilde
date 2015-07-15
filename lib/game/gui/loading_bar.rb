require 'pry'

module Gui
  class LoadingBar < GuiElement
    def initialize(x, y, width, height, window, bg_color: 0x222222, fill_color: 0xdfdfdf)
      super(x, y, width, height, window)
      @percentage = 0
      @width = [@width - 2, 1].max
      @height = [@height - 2, 1].max

      @bg_color = bg_color
      @fill_color = fill_color

      background_image = Magick::Image.new(@width, @height) {
        self.background_color = Utils::ColorHelper::to_hex_color(bg_color)
      }
      background_image.border(1,1,Utils::ColorHelper::to_hex_color(fill_color))
      @background = Gosu::Image.new(background_image, tileable: true)

      bar_image = Magick::Image.new(1, @height) {
        self.background_color = Utils::ColorHelper::to_hex_color(fill_color)
      }
      @bar = Gosu::Image.new(bar_image, tileable: true)

      @image_text = Gosu::Image.from_text(@window, "Miep", Gosu.default_font_name, 20)
    end

    def progress(value = 1)
      @percentage += value
      @percentage = [0, [@percentage, 100].min].max
    end

    def percentage=(value)
      @percentage = value
      @percentage = [0, [@percentage, 100].min].max
    end

    def update
      progress

      color = Utils::ColorHelper::to_hex_color(@fill_color)
      width = [(@width * @percentage / 100).to_i, @width - 2].min
      bar_image = Magick::Image.new(width, @height - 2) {
        self.background_color = color
      }
      @bar = Gosu::Image.new(bar_image, tileable: true)
    end

    def draw
      @background.draw(@x, @y, 1)
      if @percentage > 0
        @bar.draw(@x + 1, @y + 1, 2)
      end
    end
  end
end
