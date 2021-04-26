module ApplicationHelper

    def conditionaly_present_nav_buttons
        if !logged_in?
            concat content_tag(:li, class: "nav-bar-float-right")  {
                link_to 'Login', login_path
            }
            content_tag(:li, class: "nav-bar-float-right") {
                 link_to 'Sign Up', new_user_path
            }
        else
            content_tag(:li, class: "nav-bar-float-right")  {
                link_to "Logout", logout_path, method: "post", class: "nav-bar-float-right"
            }
        end
    end

end

