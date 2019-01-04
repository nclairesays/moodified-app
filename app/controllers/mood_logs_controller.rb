class MoodLogsController < ApplicationController
    def index
        @mood_logs = MoodLog.all.sort_logs
    end

    def new
        @mood_log = MoodLog.new(flash[:mood_log_attributes])
        @moods = Mood.all.sort_moods
        @users = User.all.sort_users
    end

    def edit
        @mood_log = MoodLog.find(params[:id])
        @moods = Mood.all.sort_moods
        @users = User.all.sort_users
    end
    
    def create
        mood_log = MoodLog.new(mood_log_params)
        if mood_log.valid?
            mood_log.save
            redirect_to mood_logs_path
        else
            flash[:errors] = mood_log.errors.full_messages
            flash[:mood_log_attributes] = mood_log.attributes
            redirect_to new_mood_log_path
        end
    end

    def update
        mood_log = MoodLog.find(params[:id])
        mood_log.update(mood_log_params)
        if mood_log.valid?
            redirect_to mood_logs_path
        else
            flash[:errors] = mood_log.errors.full_messages
            redirect_to edit_mood_log_path
        end
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
