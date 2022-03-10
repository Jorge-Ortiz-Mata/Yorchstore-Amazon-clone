class PagesController < ApplicationController

  before_action :user?
  before_action :user_profile

  def home
    @articles = Article.order('created_at DESC')
    @article = Article.new
  end

end
