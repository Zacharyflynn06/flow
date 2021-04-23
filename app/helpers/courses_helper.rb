module CoursesHelper

    def present_review_button_if_logged_in(course)
        if logged_in?
            tag.div class: "button" do 
                link_to 'Leave a Review', new_course_review_path(course.id)
            end
        end
    end


    def conditionally_display_heading(user)
        if params[:user_id]
            tag.h1 " Here are #{user.full_name}'s Courses" 
        else
            tag.h1 'Here are our courses'
        end
    end

    def create_new_course_if_admin
        if logged_in? && current_user.admin?
            tag.div class: "button" do
                link_to 'Create a new Course', new_course_path
            end
        end
    end

    def present_edit_course_button_if_admin
        if logged_in? && current_user.admin?
            concat tag.div {
                concat link_to 'Edit Course', edit_course_path, class: "button"
            }
            tag.div {
                button_to 'Delete Course', course_path(@course), method: :delete, class: "button"
            }
        end
    end

    def conditionally_present_teacher_fields
        if params[:user_id]
             f.hidden_field :teacher_id 
        else
            "Teacher:  #{f.collection_select(:teacher_id, User.teacher, :id, :full_name, prompt: "Select a Teacher ")}"
        end 
    end

    def display_course_filter
        tag.div do
            form_with(url: courses_path, method: :get) do |f|
                f.label :filter, "Filter courses by level"
                f.select :filter, options_for_select(["All", 1, 2, 3]), prompt: false
                f.submit "Search"
            end
        end
    end

end