module WelcomeHelper

    def conditionally_present_welcome_page_buttons
        if !logged_in?
            concat tag.div {
                link_to 'Sign Up', new_user_path, class: "button"
            }

            tag.div{
                link_to 'Log In', login_path, class: "button"
            }
        end
    end
end
