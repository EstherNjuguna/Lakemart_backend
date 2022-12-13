class ApplicationController < ActionController::API
    include ActionController::Cookies
    wrap_parameters format: []
    #app responsses
    def appresponse(status_code: 200, message: "Success",body: nil)
        render json: {
            status: status_code,
            message: message,
            body: body
        },status: status_code
    
    end
    def authorize
        return appresponse(status_code: 401, message: "You are unauthorized") unless session.include? :user_id
    end
    def authorize_seller
        return appresponse(status_code: 401, message:"cannot perform action" ) unless session[:user_type] == "seller" || session[:user_type] =="admin"
end
end
