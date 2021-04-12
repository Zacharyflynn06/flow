class CoursesController < ApplicationController

    before_action :find_course, only: [:show, :edit, :update]

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
        @course = Course.all
    end

    def show
    end

    def edit
    end

    def update
        if @course.update(course_params)
            redirect_to class_path(@course)
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
        params.require(:course).permit(:name, :description, :level, :price, :duration, :day, :time)
    end

    def standard_time(object)
        object.time.strftime()
    end
end
