class ProductsController < ApplicationController

  before_action :user?
  before_action :current_user_and_article
  before_action :user_profile

  def index
    @products = current_user.articles
  end



end
