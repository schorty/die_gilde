require 'require_all'
require_rel '../views'

module Controllers
  class ApplicationController
    def initialize(window)
      @options = {window: window}
      @action = ""
    end

    def view
      namespace = self.class.to_s.split('::').last.sub(/Controller$/, '')
      class_from_string("Views::#{namespace}::#{camelize(@action)}")
    end

    def update
    end

    def draw
      @view.draw(@options)
    end

    def go_to_action(action)
      @action = action
      @view = view.new
    end

    private

    def class_from_string(str)
      str.split('::').inject(Object) do |mod, class_name|
        mod.const_get(class_name)
      end
    end

    def camelize(string)
      string.sub!(/^[a-z\d]*/) { $&.capitalize }
      string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }

      string
    end
  end
end
