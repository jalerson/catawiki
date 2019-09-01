class InvalidPositionError < StandardError
  attr_reader :position

  def initialize(message, position)
    super(message)
    @position = position
  end
end
