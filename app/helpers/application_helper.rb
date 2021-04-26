module ApplicationHelper

    def conditionaly_present_nav_buttons
        if !logged_in?
            concat tag.li {
                link_to 'Login', login_path, class: "nav-bar-float-right"
            }
            tag.li {
                 link_to 'Sign Up', new_user_path, class: "nav-bar-float-right"
            }
        else
            tag.li {
                link_to "Logout", logout_path, method: "post", class: "nav-bar-float-right"
            }
        end
    end

end

