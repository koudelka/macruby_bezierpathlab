class ControlPointView < NSView

  attr_accessor :color
  attr_writer :controller

  def initWithFrame(frameRect)
    super
    @path = NSBezierPath.bezierPathWithOvalInRect(bounds)
    self
  end

  def drawRect(dirty_rect)
    @color.set

    @path.fill
  end

  def mouseDragged(event)
    @controller.mouseDragged(event)
  end

  def center
    NSPoint.new(frame.origin.x + frame.size.width/2,
                frame.origin.y + frame.size.height/2)
  end

  def superview_location_relative_to_window
    return @cached_superview_location_relative_to_window if @cached_superview_location_relative_to_window

    x = 0
    y = 0
    parent = superview
    while(parent != nil) do
      x += parent.frame.origin.x
      y += parent.frame.origin.y
      parent = parent.superview
    end

    @cached_superview_location_relative_to_window = NSPoint.new(x, y)
  end
end
