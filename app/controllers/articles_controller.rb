class ArticlesController < ApplicationController

  before_action :user?
  before_action :user_profile
  before_action :user_is_a_buyer?
  before_action :set_article, only: %i[ show edit update destroy ]

  def new
    @article = Article.new
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id 

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to root_path }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@article, partial: "articles/form", locals: { article: @article })}
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def addCar
    @article = Article.new(title: 'New article created by clicking on add car link.')
    if @article.save
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :stock, :price, images: [])
    end
end
