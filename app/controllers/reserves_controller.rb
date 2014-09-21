class ReservesController < ApplicationController
  before_action :authenticate_user!

  def show
    unless current_user.is_admin? and current_user.id == params[:id].to_i
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
    @reserves = User.id_is( params[:id] ).reserving.order( updated_at: :asc ).page( params[:page] ).per( 20 )
  end

  def new
    @item = Item.id_is( params[:id] )
    render :show_modal, locals: { type: :new }
  end

  def create
    params[:reserve_item].each do |id, amount|
      @reserve = current_user.reserves.build item_id: id.to_i, amount: amount.to_i
    end
    @result = @reserve.save
    if @result
      flash[:notice] = "#{Item.id_is( @reserve.item_id ).name}を予約しました。"
      redirect_to reserve_path( current_user.id )
      return
    else
      flash[:alert] = "物品の予約に失敗しました。" unless @result
      redirect_to items_path
    end
  end

  def edit
    @reserves = Reserve.where id: params[:reserve_ids].split( ',' )
    render :show_modal, locals: { type: :edit }
  end

  def update
    params[:lend_items].each do |id, amount|
      @reserve = Reserve.id_is id
      current_user.lends.build item_id: @reserve.item_id, amount: amount.to_i, reserve_id: @reserve.id
      @result = @reserve.update( lent_flag: true )
      break unless @result
    end
    current_user.save if @result
    if @result
      flash[:notice] = "#{params[:lend_items].size}個の物品を貸出しました。"
      redirect_to lend_path( current_user.id )
      return
    else
      flash[:alert] = "物品の貸出に失敗しました。"
      redirect_to reserve_path( current_user.id )
    end
  end

  def delete
    @reserve = Reserve.id_is( params[:id] )
    render :show_modal, locals: { type: :delete }
  end

  def destroy
    @reserve = Reserve.id_is( params[:id] )
    @result = @reserve.destroy
    flash[:notice] = "#{@reserve.item.name}の予約を取消しました。" if @result
    flash[:alert] = "予約の取消に失敗しました。" unless @result
    redirect_to reserve_path( current_user.id )
  end
end
