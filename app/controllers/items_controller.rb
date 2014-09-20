class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_item

  def index
    @items = Item.search( params[:keyword] ).order( updated_at: :desc ).page( params[:page] ).per( 20 )
  end

  def show
    render :show_modal, locals: { type: :show }
  end

  def new
    render :show_modal, locals: { type: :form }
  end

  def create
    @item = Item.new( item_params )
    @result = @item.save
    flash[:notice] = "#{@item.name}を登録しました。" if @result
    render :commit
  end

  def edit
    render :show_modal, locals: { type: :form }
  end

  def update
    @result = @item.update( item_params )
    flash[:notice] = "#{@item.name}を更新しました。" if @result
    render :commit
  end

  def delete
    render :show_modal, locals: { type: :delete }
  end

  def destroy
    @result = @item.update( trashed_flag: true )
    flash[:notice] = "#{@item.name}を削除しました。" if @result
    flash[:alert] = '削除に失敗しました。'
  end

  private

  def load_item
    @item = Item.id_is( params[:id] ) if params[:id]
  end

  def item_params
    params.require( :item ).permit( :name, :place, :attachments, :amount, :category, :lending_period )
  end
end
