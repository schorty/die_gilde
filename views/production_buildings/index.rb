require 'rmagick'
require 'require_all'
require_rel '../../helpers/gui/image'

module Views
  module ProductionBuildings
    class Index
      def draw(options)
        Helpers::Gui::Image.new(30, 30, 0, 100, 200, options[:window])
      end
    end
  end
end
