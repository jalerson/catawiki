class Direction
  attr_reader :facing

  ROTATIONS = %w[L R].freeze

  DIRECTIONS = {
    'N' => { left: 'W', right: 'E' },
    'E' => { left: 'N', right: 'S' },
    'W' => { left: 'S', right: 'N' },
    'S' => { left: 'E', right: 'W' }
  }.freeze

  def initialize(facing)
    unless DIRECTIONS.keys.include?(facing)
      raise ArgumentError, "Invalid direction! Must be #{DIRECTIONS.keys.join(', ')}"
    end

    @facing = facing
  end

  def left!
    @facing = DIRECTIONS[facing][:left]
  end

  def right!
    @facing = DIRECTIONS[facing][:right]
  end

  def to_s
    facing
  end
end
