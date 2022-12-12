class AuthenticationController < ApplicationController
    def create
 user = User.create!(user_params)
 if user.valid?
    appresponse(status_code:201, message: "Created succesfully", body:user)
 else
    appresponse(status_code:422, message: "invalid inputs", body:user.errors.full_messages)
    end
end
    def login
       user =User.find_by(email: params[:email])
       if user&.authenticate(params[:password])
        appresponse(status_code: 200,message: "Log in Succesful", body:user )
       else
        appresponse(status_code: 401, message: "Invalid user") 
       end
    end
    private
    def user_params
        params.permit(:name,:email,:password,:picture,:user_type)
    end
end
