class OrdersController < ApplicationController

    before_action :user?
    before_action :current_user_and_article
    before_action :user_profile

    def car
        @orders = current_user.orders
    end

    def create 
        @article = Article.find(params[:article].to_i)
        @quantity_request = params[:quantity].to_i
        @total_price = @article.price * @quantity_request
        if @article.present? && @quantity_request.to_i > 0
            if @quantity_request.to_i <= @article.stock
                @order = Order.new(user_id: current_user.id, article_id: @article.id, quantity: @quantity_request, product_title: @article.title, product_description: @article.description, total_price: @total_price)
                if @order.save
                    @var_x = @article.stock - @quantity_request
                    @article.update(stock: @var_x)
                    redirect_to @article, notice: "Article added to your car."
                end
            else
                redirect_to @article, alert: "There aren't many items in stock. Come back later."
            end
        else
            redirect_to @article, alert: "Something happened. Please, try again."
        end
    end

    def buy
        @order = Order.find(params[:order])
        @user_money = current_user.profile.bank_money
        if @user_money > @order.total_price
            @var_z = @user_money - @order.total_price
            current_user.profile.update(bank_money: @var_z)
            @order.destroy
            redirect_to car_path, notice: "You've bought: Article ID: #{@order.article.id}. Article title: #{@order.article.title}. Article description: #{@order.article.description}. Order ID: #{@order.id}. Quantity:#{@order.quantity} .Total purchase: #{@order.total_price}"

        else
            redirect_to car_path, alert: "You don't have enough money in your bank account."
        end
    end


    def destroy
        @order = Order.find(params[:order])
        @article = Article.find(@order.article_id)
        @var_y = @article.stock + @order.quantity 
        @article.update(stock: @var_y)
        @order.destroy
        redirect_to car_path, notice: "You've removed the order: #{@order.id}, from your car. Article title: #{@article.title}, Article description: #{@article.description}"
    end

end