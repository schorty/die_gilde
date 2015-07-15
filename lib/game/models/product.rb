module Models
  class Product
    def crafting_time
      @crafting_time
    end

    def value
      @value
    end

    def name
      @name
    end

    def required_resources
      @required_resources
    end

    def image(bg_color = 0x303030, size = :big)
      image = Magick::Image.read(@image_path) {
        self.background_color = Utils::ColorHelper::to_hex_color(bg_color)
      }

      if size != :big
        image.resize!(16, 16)
      end

      image.first
    end
  end
end
