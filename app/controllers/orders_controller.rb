class OrdersController < ApplicationController

    before_action :user?
    before_action :current_user_and_article
    before_action :user_profile

    def create 
        @article = Article.look_up(params[:article], params[:quantity])
        @quantity_request = params[:quantity]
        if @article.present? && @quantity_request.to_i > 0
            if @quantity_request.to_i <= @article.stock
                redirect_to @article, notice: "Article added to your car."
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