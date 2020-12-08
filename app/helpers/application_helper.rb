module ApplicationHelper
   def render_nav_bar
        if logged_in?
            render partial: 'layouts/loggedin_links'
        else
            render partial: 'layouts/loggedout_links'
        end
    end

    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end
end
