class Rectangle < Shape
   has_one :dimension, dependent: :destroy

   accepts_nested_attributes_for :dimension

   def get_area
      update(area: self.dimension.width * self.dimension.height)
   end
end