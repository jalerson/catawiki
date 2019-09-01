class Surface
  attr_accessor :x, :y

  def initialize(x, y)
    raise ArgumentError, 'Surface x and y must be greater than zero' if x <= 0 || y <= 0

    @x = x
    @y = y
  end
end
