class AttractionsController < ApplicationController
    before_action :set_attraction, only:[:show, :edit, :update, :destroy]

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
    end


    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.create(attractions_params)
        if @attraction.save
        
        redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def edit
 
    end

    def update
        @attraction.update(attractions_params)
        if @attraction.update(attractions_params)
            redirect_to attraction_path
        else
            render :edit
        end
    end

    def destroy
        @attraction.destroy
        redirect_to attractions_path
    end

    private
    
    def set_attraction
        @attraction = Attraction.find(params[:id])
    end

    def attractions_params
        params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end

end