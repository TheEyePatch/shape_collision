class Rectangle < Shape
   has_one :dimension

   accepts_nested_attributes_for :dimension
end