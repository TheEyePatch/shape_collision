class ShapesController < ApplicationController
    before_action :get_shapes
    def index
        
        render json:{
            message: "Successfuly get all shapes",
            data:{
                circles: @circles,
                rectangles: @rectangles
            }
        },
        status: :ok
    end

    
    def get_shapes
        @circles = []
        @radi = Rad.all
        @radi.each{|radius|@circles.push(
            {   id: radius.circle_id, 
                x: radius.circle.x,
                y: radius.circle.y,
                radius: radius.value
            }) 
        }

        @rectangles = []
        @dimensions = Dimension.all
        @dimensions.each{|dimension| @rectangles.push(
            id:dimension.rectangle.id,
            x: dimension.rectangle.x,
            y: dimension.rectangle.y,
            width: dimension.width,
            height: dimension.height
        ) }
    end
end
