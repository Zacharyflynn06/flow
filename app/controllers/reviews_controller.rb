class ReviewsController < ApplicationController

    def new
        @review = Review.new(course_id: params[:course_id], student_id: session[:user_id])
    end

    def create
        byebug
        @review = Review.new(review_params)
        if @review.valid?
            @review.save
            byebug
            redirect_to course_path(@review.course.id)
        else
            render :new
        end
    end

    def index 
        if params[:course_id]
            @course = Course.find(params[:course_id])
                if @course.nil?
                    redirect_to courses_path, alert: "Artist not Found"
                else
                    @reviews = @course.reviews
                end
        else
        @reviews = @course.reviews
        
        end
    end
    def edit

    end

    def update

    end

    def destroy
        
    end

    def review_params
        params.require(:review).permit(:content, :rating, :student_id, :course_id)
    end
end
