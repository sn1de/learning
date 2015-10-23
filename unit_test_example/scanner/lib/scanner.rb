class Scanner

  def initialize(start = 1, finish = 5)
    @start = start
    @finish = finish
    @current = @start
    @direction = 1
  end

  def reverse_direction
    @direction *= -1
  end

  def boundary?
    @current == @finish || @current == @start
  end

  def move_next
    @current += @direction
    if boundary?
      reverse_direction
    end
  end

  def scan
    s = @current
    move_next
    s
  end

end