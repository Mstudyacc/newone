class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)  
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(articles_permissions)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(articles_permissions)
      flash[:notice] = "Article was successfully updated"

      redirect_to @article 
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def articles_permissions
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can edit or delete only your articles!"
      redirect_to @article
    end
  end

end