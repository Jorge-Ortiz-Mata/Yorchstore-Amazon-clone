class OrdersController < ApplicationController

    before_action :user?
    before_action :current_user_and_article
    before_action :user_profile

    def create 
        @article = Article.find(params[:article].to_i)
        @quantity_request = params[:quantity].to_i
        if @article.present? && @quantity_request.to_i > 0
            if @quantity_request.to_i <= @article.stock
                @order = Order.new(user_id: current_user.id, article_id: @article.id, quantity: @quantity_request, product_title: @article.title, product_description: @article.description)
                if @order.save
                    @var_x = @article.stock - @quantity_request
                    @article.update(stock: @var_x)
                    redirect_to @article, notice: "Article added to your car. #{@var_x}"
                end
            else
                redirect_to @article, alert: "There aren't many items in stock. Come back later."
            end
        else
            redirect_to @article, alert: "Something happened. Please, try again."
        end
    end


    def destroy
    end

end