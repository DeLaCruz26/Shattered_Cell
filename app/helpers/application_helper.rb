module ApplicationHelper
    def signin_or_login
        page = current_page
        page == '/signin' || page == '/login'
    end
end
