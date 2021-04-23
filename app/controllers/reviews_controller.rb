class ReviewsController < ApplicationController
    before_action :find_review, only: [:edit, :update]
    before_action :redirect_if_not_logged_in
    def new
        @review = Review.new(course_id: params[:course_id], student_id: session[:user_id])
    end

    def create
        
        @review = Review.new(review_params)
        if @review.valid?
            @review.save
            redirect_to course_path(@review.course.id)
        else
            render :new
        end
    end

    def index 
        if params[:course_id]
            @course = Course.find(params[:course_id])
                if @course.nil?
                    redirect_to courses_path, alert: "Course not Found"
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
        if @review.update(review_params)
            redirect_to course_path(@review.course)
        else
            render :edit
        end
    end
    
    def destroy
        
    end
    private

    def find_review
        if @review = Review.find_by(id: params[:id])
            @review
        else
            redirect_to reviews_path, alert: "review doesn't exist!"
        end
    end


    def review_params
        params.require(:review).permit(:content, :rating, :student_id, :course_id)
    end
end
