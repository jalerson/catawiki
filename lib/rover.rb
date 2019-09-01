require 'forwardable'

class Rover
  extend Forwardable

  attr_reader :position, :direction
  attr_accessor :commands

  def_delegator :position, :coordinates
  def_delegator :direction, :facing

  def initialize(position, direction, commands = [])
    @position = position
    @direction = direction
    @commands = commands
  end

  def move!
    @position = position.next(direction.facing)
  rescue InvalidPositionError => e
    raise InvalidMovementError, "Invalid movement to #{e.position.coordinates}"
  end

  def turn_left!
    @direction.left!
  end

  def turn_right!
    @direction.right!
  end

  def start!
    commands.each { |command| execute(command) }
  end

  def to_s
    "#{position} #{direction}"
  end

  private

  def execute(command)
    case command
    when 'M' then move!
    when 'L' then turn_left!
    when 'R' then turn_right!
    else
      raise InvalidCommandError, "#{command} is not a valid command"
    end
  end
end
