class ProductsController < ApplicationController
def create
# if valid_seller?
    user = User.find(session[:user_id])
    # if user
       
        # appresponse(status_code: 201, message: "Created product succesfully", body:product)
        appresponse(status_code: 401, message: "You do not have permission to add a product to the store") unless user.valid?
        product = user.products.create(product_params)
        appresponse(status_code: 201, message: "Created successfully", body: product)
# end
#     else
#         appresponse(status_code: 401, message: "You cannot post new products")
#     end
# else
#     appresponse(status_code: 401, message: "You cannot post new products")
# end
end
def list_product
end
def update
end
def delete
end
private
def product_params
    params.permit(:name,:description,:price,:category,:picture,:user_id)
end
# def valid_seller?
# if session[:user_type] == 0
#     false
# else
#     true
# end

end
