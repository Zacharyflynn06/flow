class StudentsController < ApplicationController

    def new
        @student = Student.new
    end
    
    def index 
        @students = Student.all
    end

    def show
        find_student
    end

    def edit

    end

    def update
        
    end

    def destroy

    end

    private

    def find_student
        @student = Student.find_by(id: params[:id])
    end

    def student_params
        params.require(:student).permit(:first_name, :last_name)
    end

    
end
