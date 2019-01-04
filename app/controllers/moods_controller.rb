class MoodsController < ApplicationController
    def index
        @moods = Mood.all.sort_moods
    end

    def new
        @mood = Mood.new
    end

    def show
        @mood = Mood.find(params[:id])
    end

    def create
        mood = Mood.new(mood_params)
        if mood.valid?
            mood.save
            redirect_to moods_path
        else
            flash[:errors] = mood.errors.full_messages
            redirect_to new_mood_path
        end
    end

    def edit
        @mood = Mood.find(params[:id])
    end

    def update
        mood = Mood.find(params[:id])
        mood.update(mood_params)

        if mood.valid?
            redirect_to mood
        else
            flash[:errors] = mood.errors.full_messages
            redirect_to edit_mood_path
        end
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
