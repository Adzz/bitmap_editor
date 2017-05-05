class VerticalLine
  def initialize(args)
    @start  = [args.fetch(1).to_i, args.fetch(2).to_i].sort.min
    @finish = [args.fetch(1).to_i, args.fetch(2).to_i].sort.max
    @x_coordinate = args.fetch(0).to_i
  end

  def coordinates
    @start.upto(@finish).each_with_object([]) do |y_coordinate, coordinates|
      coordinates << [@x_coordinate, y_coordinate]
    end
  end
end
