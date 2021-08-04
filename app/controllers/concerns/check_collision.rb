module CheckCollision

  def compare_shapes(dx, dy, dr, collider, collidee)
    theta = get_theta(dx, dy, dr) # Inner angle of triangle
    collider_hyp =  get_hypotenuse(collider, theta, dx, dy) # Collider hypotenuse
    collidee_hyp = get_hypotenuse(collidee, theta, dx, dy)  # Collidee hypotenuse

    total_hyp = collider_hyp + collidee_hyp
    return compare_hypotenuse(total_hyp, dr, collider, collidee, theta, collidee_hyp, collider_hyp)
  end

  def get_theta(dx, dy,dr)
    if dx >= dy
      theta = Math.asin(dy/dr)
    elsif dx <= dy
      theta = Math.asin(dx/dr)
    end
    return theta
  end

  def get_hypotenuse(shape, theta, dx, dy)
    if shape.type == 'Rectangle'
      shape_hyp = get_rectangle_hypotenuse(shape, theta, dx, dy)
    elsif shape.type == 'Circle'
      shape_hyp = shape.rad.value # Hypotenuse is equal to the radius of the circle
    end
    return shape_hyp
  end

  def get_rectangle_hypotenuse(shape, theta, dx, dy)
    if dx >= dy
      hyp = (shape.dimension.width.to_f / 2) / Math.cos(theta)
    elsif dx <= dy
      hyp = (shape.dimension.height.to_f / 2 ) / Math.cos(theta)
    end
    return hyp
  end

  def compare_hypotenuse(total_hyp, dr, collider, collidee, theta, collidee_hyp, collider_hyp)
    if total_hyp >= dr || dr == 0
      if collider.area > collidee.area
        collider.update(x: collidee.x, y: collidee.y)
        retained = collider
        deleted = collidee
        collidee.destroy

      elsif collider.area < collidee.area
        retained = collidee
        deleted = collider
        collider.destroy
      end
    else
      retained = nil
      deleted = nil
    end

    result = {
      retained: retained,
      deleted: deleted,
      total_hyp: total_hyp,
      theta: theta,
      collidee_hyp: collidee_hyp,
      collider_hyp: collider_hyp
    }

    return result
  end
end