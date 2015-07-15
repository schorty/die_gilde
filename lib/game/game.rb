require 'require_all'
require 'rmagick'
require_rel 'gui'
require_rel 'models'
require_rel 'utils'

class Game
  def initialize(width, height)
    @buildings = []
    # @buildings << Models::Blacksmith.new
    @width = width
    @height = height
    rapier = Models::Products::Rapier.new
    @image = Gosu::Image.new(rapier.image.first, tileable: false)
  end

  def button_down(id, options = {})
    if id == Gosu::MsLeft
      @buttons.each do |b|
        if b.clicked?(options[:mouse_x], options[:mouse_y])
          b.down
          break
        end
      end
    end
  end

  def button_up(id, options = {})
    if id == Gosu::MsLeft
      @buttons.each do |b|
        if b.clicked?(options[:mouse_x], options[:mouse_y])
          b.up
          break
        end
      end
    end
  end

  def update
    @buildings.each { |b| b.update }
  end

  def draw
    @image.draw(10,10,0)
    # @buttons.each { |b| b.draw }
  end
end
