module ReviewsHelper
    def display_header(review)
        if params[:repair_id]
            content_tag(:h1, "Add a review for #{review.repair.device.name} #{review.repair.device.model} - #{review.repair.repair_description}")
        else
            content_tag(:h1, "Create a review")
        end
    end
end