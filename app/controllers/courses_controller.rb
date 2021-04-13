class CoursesController < ApplicationController

    before_action :find_course, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)

        if @course.valid?
            @course.save
            redirect_to class_path(@course)
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
        if params[:user_id]
            # byebug
            @user = User.find_by(id: params[:user_id])
            byebug
            @course = @user.given_courses.find_by(id: params[:id])
            if @course.nil?
                redirect_to user_path(@user), alert: "Course not found"
            end
        else
            @course = Course.find(params[:id])
        end
    end

    def edit
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
        params.require(:course).permit(:name, :description, :level, :price, :duration, :day, :time, :user_id)
    end

    def standard_time(object)
        object.time.strftime()
    end
end
