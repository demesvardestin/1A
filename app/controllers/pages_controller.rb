class PagesController < ApplicationController
    def home
        @latest_posts = Article.published.where(project_id: nil)
        .order("created_at DESC")
        .limit(10)
        .paginate(page: params[:page], per_page: 10)
    end
    
    def latest
        @article = Article.last
        redirect_to blog_show_article_path(:slug => @article.slug, :id => @article.id)
    end
end