require_relative 'gui/button.rb'
require_relative 'models/building.rb'
require_relative 'models/production.rb'

class Game
  def initialize
    @buildings = []
    @buildings << Building.new
    @buttons = []
    @buttons << Gui::Button.new("Neue Produktion", 150, 30, 100, 100, self, action: ->{
      #@buildings.first.add_production(Production.new(@buildings.first, "Rapier", 2, Time.now))
    })
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
    @buttons.each { |b| b.draw }
  end
end
