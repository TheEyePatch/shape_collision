class CollisionsController < ApplicationController
    include CheckCollision
    before_action :get_distances
    def index
        render json: {
            collider: {
                type: @collider.type,
                id: @collider.id,
                area: @collider.area
            },
            collidee:{
                type: @collidee.type,
                id: @collidee.id,
                area: @collidee.area
            },

            distance: @dr,
            total_hyp: @total_hyp,
            horizontal_dist: @dx,
            vertical_dist: @dy,
            theta: @theta,
            collidee_hyp: @collidee_hyp,
            collider_hyp: @collider_hyp,
            retained: @retained,
            deleted: @deleted
        }
    end

    private
    
    def get_distances
        @collider = Shape.find(params[:collider])
        @collidee = Shape.find(params[:collidee])
        @collider.get_area()
        @collidee.get_area()
        #Horizontal distance between the center of two shapes
        @dx = (@collidee.x - @collider.x).abs()

        #Vertical distance between the center of two shapes
        @dy = (@collider.y - @collidee.y).abs()

        #Distance between the two center of two shapes
        @dr = Math.sqrt(@dx**2 + @dy**2)
        result = compare_shapes(@dx, @dy, @dr, @collider, @collidee)

        @retained = result[:retained]
        @deleted = result[:deleted]
        @total_hyp = result[:total_hyp]
        @theta = result[:theta]
        @collider_hyp = result[:collider_hyp]
        @collidee_hyp = result[:collidee_hyp]

    end
end
