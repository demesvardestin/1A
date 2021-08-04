class AdminsController < ApplicationController
  before_action :set_admin
  
  def update
    @admin.update(admin_params)
    @admin.save!
    
    redirect_to :back, notice: "profile info saved!"
  end
  
  def dashboard
    @articles = current_admin.articles.paginate(:per_page => 10, :page => params[:page])
    @albums = current_admin.albums.paginate(:per_page => 10, :page => params[:page])
  end
  
  private
  
  def set_admin
    @admin = current_admin
  end
  
  def admin_params
    params.require(:admin)
    .permit(
      :first_name,
      :last_name,
      :website,
      :twitter,
      :linkedin,
      :instagram,
      :github,
      :bio,
      :facebook)
  end
end
