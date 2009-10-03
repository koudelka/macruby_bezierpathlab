class BezierLabViewController < NSViewController

  attr_reader :points

  def awakeFromNib
    @points = {}
    {
      from: NSColor.blackColor,
      to: NSColor.blackColor,
      first_control: NSColor.redColor,
      second_control: NSColor.blueColor,
    }.each do |name, color|
      @points[name] = ControlPoint.new.initWithParentView(view, andColor:color)
    end

    reset_starting_points
  end

  def reset_starting_points
    size = view.frame.size
    {
      from: NSPoint.new(20, 20),
      to: NSPoint.new(size.width - 20, size.height - 20),
      first_control: NSPoint.new(20, size.height - 20),
      second_control: NSPoint.new(size.width - 20, 20)
    }.each do |name, point|
      @points[name].view.setFrameOrigin(point)
    end
  end
end
