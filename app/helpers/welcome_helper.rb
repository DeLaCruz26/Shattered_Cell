module WelcomeHelper
    def welcome_page
        '/' == request.env['PATH_INFO']
    end
end
