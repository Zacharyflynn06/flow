class TeachersController < ApplicationController

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)
            if @teacher.valid?
                @teacher.save
                redirect_to teacher_path(@teacher)
            else
                render :new
            end
    end
    
    def index 
        @teachers = Teacher.all
    end

    def show
        find_teacher
    end

    def edit
        find_teacher
    end

    def update
        find_teacher
        if @teacher.update(teacher_params)
            redirect_to teacher_path(@teacher)
        else
            render :edit
        end
    end

    def destroy

    end

    private

    def find_teacher
        @teacher = Teacher.find_by(id: params[:id])
    end

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :years_experience, :bio)
    end


end
