class Scanner

  def initialize(start = 1, finish = 5)
    @start = start
    @finish = finish
    @current = @start
    @direction = 1
  end

  def scan
    s = @current
    @current += @direction
    if @current == @finish || @current == @start
      @direction *= -1
    end
    s
  end

end