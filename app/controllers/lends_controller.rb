class LendsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = Item.where( id: params[:lend_ids].split( ',' ) )
    render :show_modal, locals: { type: :new }
  end

  def create
    params[:lend_items].each do |id, amount|
      current_user.lends.build item_id: id.to_i, amount: amount.to_i
    end
    @result = current_user.save
    flash[:notice] = "#{params[:lend_items].size}個の物品を貸出しました。" if @result
    flash[:alert] = "物品の貸出に失敗しました。" unless @result
    redirect_to root_path
  end
end
