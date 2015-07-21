module Helpers
  class ColorHelper
    def ColorHelper::to_hex_color(value)
      '#' + value.to_i.to_s(16).rjust(6, '0')
    end
  end
end
