class StoreController < ApplicationController
  def index
		@products = Product.find_products_for_sale
		@time = Time.now
		@count = increment_count
  end

	def increment_count
		if session[:counter].nil?
			session[:counter] = 0
		end
		session[:counter] += 1
	end

	def add_to_cart
		session[:counter] = 0
		product = Product.find(params[:id])
		@cart = find_cart
		@cart.add_product(product)
	rescue ActiveRecord::RecordNotFound
		logger.error("Attempt to access invalid product #{params[:id]}")
		redirect_to_index("Invalid product")
	end

	def empty_cart
		session[:cart] = nil
		redirect_to_index("Your cart is currently empty")
	end	

private
	def redirect_to_index(msg)
		flash[:notice] = msg
		redirect_to :action => 'index'
	end

	def find_cart
		session[:cart] ||= Cart.new
	end
end
