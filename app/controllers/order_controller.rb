class OrderController < ApplicationController
        skip_before_action :verify_authenticity_token, :only => [:create]
  
def create 
    @name = params[:name]
    @adresse = params[:adresse]
    @pizzas = params[:pizzas]
    newOrder = Order.new(:name => @name, :adresse => @adresse)
    newOrder.save
    @pizzas.each do |pizza|
      @orderPizza =Pizza.where(name: pizza).first
      newOrder_line = Orderline.new
      newOrder_line.order=newOrder
      newOrder_line.pizza=@orderPizza
      newOrder_line.save
    end
   
     render json: {"message :" => "Order created"}
end
  
   def view
    @orders= []
    @allOrders = Order.all
    @allOrders.each do |order|
      pizzas = []
      @order_lines=Order_line.where(order: order)
      @order_lines.each do |order_line|
          pizza = Pizza.find(orderline[:pizza_id])
          pizzas.push(pizza)
      end
      @orders.push({order: order ,pizzas: pizzas})
    end
end
  
  
end
