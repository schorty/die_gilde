require 'gosu'
require 'pry'
require 'require_all'
require_all '/controllers/'
require_all '/models/'
require_all '/views/'
require_all '/helpers'

class Main < Gosu::Window
  def initialize(width = 800, height = 600, fullscreen = false, update_interval = 20)
    super
    self.caption = "MVC Prototype"
    @foo_controller = ProductionBuildingsController.new(self)
    @foo_controller.go_to_action("index")
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def button_up(id)
  end

  def update
    @foo_controller.update
  end

  def draw
    @foo_controller.draw
  end

  def needs_cursor?
    true
  end
end

Main.new.show
