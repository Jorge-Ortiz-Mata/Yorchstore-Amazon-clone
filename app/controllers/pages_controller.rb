class PagesController < ApplicationController

  def home
    @articles = Article.all
    @article = Article.new
  end

end
