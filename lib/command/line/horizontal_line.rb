class HorizontalLine
  def initialize(args)
    # this is length
    @start  = [args[0].to_i, args[1].to_i].sort.min
    @finish = [args[0].to_i, args[1].to_i].sort.max
    # this is direction / orientation / axis
    @y_coordinate = args[2].to_i
  end

  def coordinates
    @start.upto(@finish).each_with_object([]) do |x_coordinate, coordinates|
      coordinates << [x_coordinate, @y_coordinate]
    end
  end
end
