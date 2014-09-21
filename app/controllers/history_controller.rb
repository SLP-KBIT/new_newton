class HistoryController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def show
    unless current_user.is_admin? and current_user.id == params[:id].to_i
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
    @lends = @user.lends( updated_at: :desc ).page( params[:page] ).per( 20 )
  end

  private

  def load_user
    @user = User.id_is( params[:id] ) if params[:id]
  end
end
