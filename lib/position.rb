class Position
  attr_reader :x, :y

  DIRECTIONS = {
    'N' => :north,
    'E' => :east,
    'W' => :west,
    'S' => :south
  }.freeze

  def initialize(x, y, surface:)
    @x = x
    @y = y
    @surface = surface

    raise InvalidPositionError.new('x and/or y cant be negative!', self) if x.negative? || y.negative?
    raise InvalidPositionError.new('Invalid position: out of surface!', self) if x > surface.x || y > surface.y
  end

  def next(facing)
    send(DIRECTIONS[facing])
  end

  def north
    Position.new(x, (y + 1), surface: @surface)
  end

  def east
    Position.new((x + 1), y, surface: @surface)
  end

  def west
    Position.new((x - 1), y, surface: @surface)
  end

  def south
    Position.new(x, (y - 1), surface: @surface)
  end

  def coordinates
    [x, y]
  end

  def to_s
    "#{x} #{y}"
  end
end
