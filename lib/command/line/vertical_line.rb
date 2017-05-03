class VerticalLine
  def initialize(args)
    @start  = [args[1].to_i, args[2].to_i].sort.min
    @finish = [args[1].to_i, args[2].to_i].sort.max
    @x_coordinate = args[0].to_i
  end

  def coordinates
    @start.upto(@finish).each_with_object([]) do |y_coordinate, coordinates|
      coordinates << [@x_coordinate, y_coordinate]
    end
  end
end
