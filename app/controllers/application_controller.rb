class ApplicationController < ActionController::API
    wrap_parameters format: []
    #app responsses
    def appresponse(status_code: 200, message: "Success",body: nil)
        render json: {
            status: status_code,
            message: message,
            body: body
        },status: status_code
    
    end
end
