class CoursesController < ApplicationController

    before_action :find_course, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alret: "User not found"
        else
            @course = Course.new
        end
    end

    def create
        @course = Course.new(course_params)
        # byebug
        if @course.valid?
            @course.save
            redirect_to course_path(@course)
        else
            render :new
        end
    end
    
    def index 
        if params[:user_id]
            @user = User.find(params[:user_id])
            if @user.nil?
                redirect_to users_path, alert: "Teacher not found"
            else
                @courses = @user.given_courses
            end
        else
            @courses = Course.all
        end
    end

    def show
        @course = Course.find(params[:id])
    end

    def edit
        redirect_if_not_admin
    end

    def update
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            render :edit
        end
    end

    def destroy
        find_course
        @course.destroy
    end

    private

    def find_course
        @course = Course.find_by(id: params[:id])
    end

    def course_params
        params.require(:course).permit(:name, :description, :level, :price, :duration, :day, :time, :teacher_id)
    end

end
