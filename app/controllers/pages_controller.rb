class PagesController < ApplicationController

  before_action :user?

  def home
    @articles = Article.order('created_at DESC')
    @article = Article.new
  end

end
