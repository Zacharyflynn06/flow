class CoursesController < ApplicationController

    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]
    before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_course, only: [:show, :edit, :update, :destroy]


    def new
        @course = Course.new(teacher_id: params[:user_id])
    end

    def create
        @course = Course.new(course_params)
        if @course.valid?
            @course.save
            redirect_to course_path(@course)
        else
            render :new
        end
    end
    
    def index

        if params["filter"]
            if params["filter"] == "All"
                @courses = Course.all
            else
                @courses = Course.filter_by_level(params[:filter])
            end
        elsif params[:user_id]
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
        @course.destroy
        redirect_to root_path, alert: "Course was removed"
    end

    private

    def find_course
        if @course = Course.find_by(id: params[:id])
            @course
        else
            redirect_to courses_path, alert: "Course doesn't exist!"
        end
    end

    def course_params
        params.require(:course).permit(:name, :description, :level, :price, :duration, :day, :time, :teacher_id)
    end

end
