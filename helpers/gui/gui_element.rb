module Helpers
  module Gui
    class GuiElement
      def initialize(x, y, window)
        @x = x
        @y = y
        @window = window
      end

      def update; end
      def draw; end
    end
  end
end
