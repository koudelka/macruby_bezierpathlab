class BezierLabView < NSView

  attr_writer :controller

  def drawRect(dirty_rect)
    path = NSBezierPath.new
    path.moveToPoint(@controller.points[:from].view.center)
    path.curveToPoint(@controller.points[:to].view.center,
                      controlPoint1:@controller.points[:first_control].view.center,
                      controlPoint2:@controller.points[:second_control].view.center)

    NSColor.blackColor.set

    path.stroke
  end

end
