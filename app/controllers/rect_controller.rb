class RectController < ApplicationController
    def index
        @rectangles = Rectangle.all
    end
    def create
        @rectangle = Rectangle.new(rectangle_params)
        if @rectangle.save
            render json:{
                message: "Created rectangle Successfully",
                data: {
                    shape: @rectangle.type,
                    x: @rectangle.x,
                    y: @rectangle.y,
                    height: @rectangle.dimension.height,
                    width: @rectangle.dimension.width
                }
            }, 
            status: :ok
        else
            render json:{
                message: @rectangle.errors.full_messages.first,
                data:{}
            },
            status: :unprocessable_entity
        end
    end

    private

    def rectangle_params
        params.require(:rectangle).permit(:x, :y, dimension_attributes: [:height, :width])
    end
end
