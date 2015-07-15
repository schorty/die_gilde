class Rapier < Product
  CRAFTING_TIME = 360.freeze
  VALUE = 350.freeze
  NAME = "Rapier".freeze

  def crafting_time
    CRAFTING_TIME
  end

  def value
    VALUE
  end

  def name
    NAME
  end
end
