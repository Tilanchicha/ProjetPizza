class OrderController < ApplicationController
        skip_before_action :verify_authenticity_token, :only => [:create]
  
def create 
    @name = params[:name]
    @adress = params[:adresse]
    @pizzas = params[:pizzas]
    newOrder = Order.new(:name => @name, :adresse => @adress)
    newOrder.save
    @pizzas.each do |pizza|
      @orderPizza =Pizza.where(name: pizza).first
      newOrderline = Orderline.new
      newOrderline.order=newOrder
      newOrderline.pizza=@orderPizza
      newOrderline.save
    end
   
     render json: {"message :" => "Order created"}
end
  
   def view
    @orders= []
    @allOrders = Order.all
    @allOrders.each do |order|
      pizzas = []
      @orderlines=Orderline.where(order: order)
      @orderlines.each do |orderline|
          pizza = Pizza.find(orderline[:pizza_id])
          pizzas.push(pizza)
      end
      @orders.push({order: order ,pizzas: pizzas})
    end
end
  
  
end
