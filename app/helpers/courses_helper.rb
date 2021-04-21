module CoursesHelper


    def conditionally_display_heading(user)
        if params[:user_id]
            tag.h1 user.full_name
        else
            tag.h1 'Here are our courses'
        end
    end

    
    def create_new_course_if_admin
        if logged_in? && current_user.admin?
            tag.div class: "button" do
                link_to 'Create a new Course', new_course_path
            end
            # content_tag(:div, link_to 'Create a new Course', new_course_path, class: "button" )
        end
    end

end