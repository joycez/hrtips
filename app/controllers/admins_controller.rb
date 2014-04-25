class AdminsController < ApplicationController
	before_action :authenticate_admin!, only: [:index]
  
  def index
    @admins = Admin.all
  end

  def destroy
  	@admin=Admin.find(params[:id])
  	@admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end

end