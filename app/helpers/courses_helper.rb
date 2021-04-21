module CoursesHelper

    def conditionally_display_heading(user)
        if params[:user_id]
            tag.h1 " Here are #{user.full_name}'s Courses" 
    
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

    def conditionally_present_teacher_fields
        if params[:user_id]
             f.hidden_field :teacher_id 
        else
            "Teacher:  #{f.collection_select(:teacher_id, User.teacher, :id, :full_name, prompt: "Select a Teacher ")}"
        end 
    end

end