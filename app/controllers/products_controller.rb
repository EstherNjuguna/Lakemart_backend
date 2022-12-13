class ProductsController < ApplicationController
    before_action :authorize
    before_action :authorize_seller
    skip_before_action :authorize_seller, only: [:list_product]
def create
# if valid_seller?
    user = User.find(session[:user_id])
    
        appresponse(status_code: 401, message: "You do not have permission to add a product to the store") unless user.valid?
        product = user.products.create(product_params)
        appresponse(status_code: 201, message: "Created successfully", body: product)

# else
#        appresponse(status_code: 401, message: "You cannot post new products")
#      end
# else
#     appresponse(status_code: 401, message: "You cannot post new products")
# end
end
def list_product

  products = Product.all
appresponse(status_code:200, body: products)

end
def update
    product =  Product.find(params[:product_id])
    appresponse(status_code: 404, message: "Item not found")unless product.valid?
    product.update(product_params)
    appresponse(status_code: 200, message:"Sucessfully Updated", body: product)
end
def delete
    product =  Product.find(params[:product_id])
    item_not_found unless product.valid?
    product.destroy
    appresponse(status_code: 200, message:"Sucessfully deleted")
end
private
def product_params
    params.permit(:name,:description,:price,:category,:picture,:user_id)
end
# def valid_seller?
# if session[:user_type] == "buyer"
#     false
# else
#     true
# end
# end
def item_not_found
    not_found(message: "That does not seem to be a valid item")
end
end
