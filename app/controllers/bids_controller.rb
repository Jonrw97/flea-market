class BidsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    @bid.item = @item
    @bid.save
    # No need for app/views/bids/create.html.erb
    redirect_to item_path(@item)
  end
  private

  def bid_params
    params.require(:bid).permit(:ammount, :item_id, status: false)
  end
end
