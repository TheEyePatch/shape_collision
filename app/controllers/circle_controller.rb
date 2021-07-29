class CircleController < ApplicationController
    def index
        @circles = Circle.all
    end
    def create
        @circle = Circle.new(circle_params)
        if @circle.save
            render json:{
                message: "Created Circle Successfully",
                data: {
                    shape: @circle.type,
                    x: @circle.x,
                    y: @circle.y,
                    radius: @circle.rad.value
                }
            }, 
            status: :ok
        else
            render json:{
                message: @circle.errors.full_messages.first,
                data:{}
            },
            status: :unprocessable_entity
        end
    end

    private

    def circle_params
        params.require(:circle).permit(:x, :y, rad_attributes: [:value])
    end
end
