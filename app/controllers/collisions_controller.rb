class CollisionsController < ApplicationController
    def update
       @collider = Shape.find(params[:id])
        render json: {
            collider: 
        }
        
    end
end
