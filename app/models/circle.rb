class Circle < Shape
    has_one :rad

    accepts_nested_attributes_for :rad
end