module ReviewsHelper
    def conditionally_display_reviews(course)
        if !course.reviews.empty?
            tag.div class: "wrapper" do
                concat tag.h3 "Reviews"
                concat tag.ul {
                    course.reviews.collect do |review|
                        concat content_tag :li, "Author: #{review.student.full_name}"
                        concat content_tag :li, "Rating: #{review.rating}"
                        concat content_tag :li, review.content
                        if logged_in? && review.student == current_user
                            concat link_to 'Edit my review', edit_review_path(review), id: review.id
                        end
                        concat tag.hr
                    end.join.html_safe
                }
            end
        end
    end

end
