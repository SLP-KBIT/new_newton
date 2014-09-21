class LendsController < ApplicationController
  before_action :authenticate_user!

  def show
    unless current_user.is_admin? and current_user.id == params[:id].to_i
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
    @lends = User.id_is( params[:id] ).lending.order( updated_at: :asc ).page( params[:page] ).per( 20 )
  end

  def new
    @items = Item.where( id: params[:lend_ids].split( ',' ) )
    render :show_modal, locals: { type: :new }
  end

  def create
    params[:lend_items].each do |id, amount|
      current_user.lends.build item_id: id.to_i, amount: amount.to_i
    end
    @result = current_user.save
    if @result
      flash[:notice] = "#{params[:lend_items].size}個の物品を貸出しました。"
      redirect_to lend_path( current_user.id )
      return
    else
      flash[:alert] = "物品の貸出に失敗しました。" unless @result
      redirect_to items_path
    end
  end

  def edit
    @lends = Lend.where id: params[:return_ids].split( ',' )
    render :show_modal, locals: { type: :edit }
  end

  def update
    params[:return_items].each do |id, status|
      @lend = Lend.id_is( id )
      @result = @lend.update returned_flag: true, status: status.to_i
      break unless @result
      @result = @lend.item.update amount: @lend.item.amount - @lend.amount if @lend.status > 0
      break unless @result
    end
    flash[:notice] = "#{params[:return_items].size}個の物品を返却しました。" if @result
    flash[:alert] = "物品の返却に失敗しました。" unless @result
    redirect_to lend_path( current_user.id )
  end
end
