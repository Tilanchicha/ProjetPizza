class OrderController < ApplicationController
        skip_before_action :verify_authenticity_token, :only => [:create]
  
def create 
    @name = params[:name]
    @adresse = params[:adresse]
    @pizzas = params[:pizzas]
    newOrder = Order.new(:name => @name, :adresse => @adresse)
    newOrder.save

   
     render json: {"message :" => "Order created"}
end
  
   def view
    @orders= []
    @allOrders = Order.all
    @allOrders.each do |order|
      pizzas = []

      @orders.push({order: order ,pizzas: pizzas})
    end
end
  
  
end
