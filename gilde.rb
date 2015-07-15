require 'gosu'

require 'require_all'
require_all 'lib/'

class Gilde < Gosu::Window

  def initialize(width = 800, height = 600, fullscreen = false, update_interval = 20)
    super
    self.caption = "Die Gilde"
    @game = Game.new(width, height)
    @background = Gosu::Image.new(Magick::Image.new(width, height) {
      self.background_color = '#bbbbbb'
    }, tileable: true)
  end

  def button_down(id)
    close if id == Gosu::KbEscape

    options = {}
    if [Gosu::MsLeft, Gosu::MsRight].include?(id)
      options[:mouse_x] = mouse_x
      options[:mouse_y] = mouse_y
    end

    @game.button_down(id, options)
  end

  def button_up(id)
    options = {}
    if [Gosu::MsLeft, Gosu::MsRight].include?(id)
      options[:mouse_x] = mouse_x
      options[:mouse_y] = mouse_y
    end

    @game.button_up(id, options)
  end

  def update
    @game.update
  end

  def draw
    @background.draw(0,0,0)
    @game.draw
  end

  def needs_cursor?
    true
  end
end

Gilde.new.show
