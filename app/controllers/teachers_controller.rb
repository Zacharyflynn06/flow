class TeachersController < ApplicationController

    def new
        @teacher = Teacher.new
    end
    
    def index 
  
    end

    def show
        find_teacher
    end

    def edit

    end

    def update
        find_teacher
    end

    def destroy

    end

    private

    def find_teacher
        @teacher = Teacher.find_by(id: params[:id])
    end

    # def teacher_params
    #     params.require((:teacher).permit(:first_name, :last_name, :years_experience)
    # end


end
