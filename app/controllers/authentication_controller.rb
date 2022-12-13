class AuthenticationController < ApplicationController
    def create
 user = User.create!(user_params)
 if user.valid?
    create_user_session(user.id, user.user_type)
    appresponse(status_code:201, message: "Created succesfully", body: user)
 else
    appresponse(status_code:422, message: "invalid inputs", body:user.errors.full_messages)
    end
end
    def login
       user =User.find_by(email: params[:email])
       if user&.authenticate(params[:password])
        create_user_session(user.id, user.user_type)
        appresponse(status_code: 200,message: "Log in Succesful", body:user)
       else
        appresponse(status_code: 401, message: "Invalid user") 
       end
    end
    def logout
        delete_user_session
        appresponse(status_code: 200, message: "Log out successfully")
    end
    private
    def user_params
        params.permit(:name,:email,:password,:picture,:user_type)
    end
    def create_user_session(user_id, user_type)
        session[:user_id] ||= user_id
        session[:user_type] ||= user_type
    end
    def delete_user_session
        session.delete :user_id
        session.delete :user_type
    end
end
