class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :user
  def update
    @bid = Bid.find(params[:id])
    @bid.update(bid_params)
    # No need for app/views/bids/update.html.erb
    redirect_to bid_path(@bid)
  end
end
