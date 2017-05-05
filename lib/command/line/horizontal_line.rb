class HorizontalLine
  def initialize(args)
    @start  = [args.fetch(0).to_i, args.fetch(1).to_i].sort.min
    @finish = [args.fetch(0).to_i, args.fetch(1).to_i].sort.max
    @y_coordinate = args.fetch(2).to_i
  end

  def coordinates
    @start.upto(@finish).each_with_object([]) do |x_coordinate, coordinates|
      coordinates << [x_coordinate, @y_coordinate]
    end
  end
end
