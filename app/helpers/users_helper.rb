module UsersHelper
    def conditionally_present_teachers_courses(user)
        if user.teacher?
            tag.div do
                concat tag.h4 "Years Teaching: #{user.years_experience}"
                concat tag.h3 link_to "Courses I Teach", user_courses_path(user.id)
            end.html_safe

        end
    end

    def present_edit_button_if_logged_in (user)
        if session[:user_id] == params[:id].to_i
            tag.div class: "button" do 
                link_to 'Edit My Page', edit_user_path(user)
            end
        end
    end


end