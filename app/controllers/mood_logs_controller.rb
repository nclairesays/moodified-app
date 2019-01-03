class MoodLogsController < ApplicationController
    def index
        @mood_logs = MoodLog.all
    end

    def new
        @mood_log = MoodLog.new
    end

    def edit
        @mood_log = MoodLog.find(params[:id])
    end
    
    def create
        @mood_log = MoodLog.create(mood_log_params)
        redirect_to mood_logs_path
    end

    def update
        mood_log = MoodLog.find(params[:id])
        mood_log.update(mood_log_params)
        redirect_to mood_logs_path
    end

    def destroy
        mood_log = MoodLog.find(params[:id])
        mood_log.destroy
        redirect_to mood_logs_path
    end

    private

    def mood_log_params
        params.require(:mood_log).permit(:mood_name, :user_name, :rating_id)
    end


end
