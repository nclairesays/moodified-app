class MoodsController < ApplicationController
    def index
        @moods = Mood.all
    end

    def new
        @mood = Mood.new
    end

    def show
        @mood = Mood.find(params[:id])
    end

    def create
        @mood = Mood.create(mood_params)
        redirect_to moods_path
    end

    def edit
        @mood = Mood.find(params[:id])
    end

    def update
        mood = Mood.find(params[:id])
        mood.update(mood_params)
        redirect_to mood
    end


    # mood_log model --> dependent: :destroy
    # def destroy
    #     mood = Mood.find(params[:id])
    #     mood.destroy
    #     redirect_to moods_path
    # end


    private

    def mood_params
        params.require(:mood).permit(:name)
    end
end
