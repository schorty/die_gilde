module Gui
  class GuiElement
    def initialize(x, y, width, height, window)
      @width = width
      @height = height
      @x = x
      @y = y
      @window = window
    end

    def update; end
    def draw; end
  end
end
