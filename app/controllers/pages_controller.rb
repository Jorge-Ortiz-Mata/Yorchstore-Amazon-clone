class PagesController < ApplicationController

  def home
    @articles = Article.order('created_at DESC')
    @article = Article.new
  end

end
