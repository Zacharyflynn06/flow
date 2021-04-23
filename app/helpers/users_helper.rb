module UsersHelper
    def conditionally_present_teachers_courses(user)
        if user.teacher?
            tag.div {
                link_to "Courses I Teach", user_courses_path(user.id), class: "button"
            }

        end
    end

    def present_edit_button_if_logged_in(user)
        if session[:user_id] == params[:id].to_i
            concat tag.div {
                concat link_to 'Edit My Page', edit_user_path(user), class: "button"
            }
            tag.div {
                button_to 'Delete My Page', user_path(user), method: :delete, class: "button"
            }
        end
    end

    def conditionally_present_image(user)
        if user.avatar.attached?
            image_tag user.avatar, class:"profile-pic"
        else
            tag.p "Image hasn't been set up!"
        end
    end

    def conditionally_present_experience(user)
        if user.teacher? || user.admin?
            tag.p "I have #{user.years_experience} years of teaching experience"
        end
    end
end