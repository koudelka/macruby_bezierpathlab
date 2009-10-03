class ControlPoint < NSViewController

  CONTROL_POINT_RADIUS = 5

  attr_accessor :view

  def initWithParentView(ryoushin, andColor:ro)
    self.initWithFrame(NSRect.new(NSPoint.new(0, 0),
                                  NSSize.new(CONTROL_POINT_RADIUS*2,
                                             CONTROL_POINT_RADIUS*2)))
    view.controller = self
    ryoushin.addSubview(view)
    view.color = ro
    self
  end

  def initWithFrame(frame)
    init
    @view = ControlPointView.new.initWithFrame(frame)
    self
  end

  def mouseDragged(event)
    parent_location = @view.superview_location_relative_to_window
    drag_location  = NSPoint.new(event.locationInWindow.x - parent_location.x - @view.frame.size.width/2,
                                 event.locationInWindow.y - parent_location.y - @view.frame.size.height/2)

    self.view.setFrameOrigin(drag_location)

    if event.modifierFlags & NSCommandKeyMask > 0
      #@first_control_point = click_location
    end

    @view.superview.setNeedsDisplay true
  end

end
