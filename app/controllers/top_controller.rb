class TopController < ApplicationController
  def index
    redirect_to user_path( current_user.id ) if current_user
  end

  def rank
    @items = Item.all.sort { |a, b| a.lends.size <=> b.lends.size }
    @items = @items.reverse.first( 20 )
  end
end
