class FileLoader
  attr_reader :lines, :surface, :rovers

  COORDINATES_REGEX = /^(?<x>\d) (?<y>\d)/.freeze
  DIRECTION_REGEX = /(?<facing>[newsNEWS])$/.freeze
  COMMANDS_REGEX = /([lmrLMR])/.freeze

  def initialize(path)
    @lines = File.open(path).readlines.map(&:chomp)
    @rovers = []
  end

  def load!
    load_surface
    load_rovers
  end

  private

  def load_surface
    raise StandardError, 'Invalid surface dimensions entry' unless lines.first.match(COORDINATES_REGEX)

    matches = COORDINATES_REGEX.match(lines.first)
    @surface = Surface.new(matches[:x].to_i, matches[:y].to_i)
  end

  def load_rovers
    lines[1, (lines.length - 1)]
      .each_slice(2) { |position, commands| load_rover(position, commands) }
  end

  def load_rover(position, commands)
    @rovers << Rover.new(
      load_position(position),
      load_direction(position),
      load_commands(commands)
    )
  end

  def load_position(position)
    raise StandardError, 'Invalid coordinates entry' unless position.match(COORDINATES_REGEX)

    matches = COORDINATES_REGEX.match(position)
    Position.new(matches[:x].to_i, matches[:y].to_i, surface: surface)
  end

  def load_direction(position)
    raise StandardError, 'Invalid direction entry' unless position.match(DIRECTION_REGEX)

    matches = DIRECTION_REGEX.match(position)
    Direction.new(matches[:facing].upcase)
  end

  def load_commands(commands)
    raise StandardError, 'Invalid command entries' unless commands.match(COMMANDS_REGEX)

    commands.scan(COMMANDS_REGEX).flatten
  end
end
