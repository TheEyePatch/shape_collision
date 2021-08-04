class Circle < Shape
    has_one :rad, dependent: :destroy

    accepts_nested_attributes_for :rad

    def get_area 
      self.update(area: Math::PI * (self.rad.value**2)) 
    end
end