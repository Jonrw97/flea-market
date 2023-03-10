class ReceiptsController < ApplicationController
  def show
    @receipt = Receipt.find(params[:id])
    users = User.where("id = ? or id = ?", @receipt.user.id, @receipt.item.user)

    @markers = users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "_info_window", locals: { user: }),
        marker_html: render_to_string(partial: "marker", locals: { user: })
      }
    end
  end

  def index
    @sell = current_user.items
    receipts = Receipt.all
    @buy = receipts.select { |r| current_user.id == r.user_id }
    @sold_count = 0
    @selling_count = 0
  end

  def create
    item = Item.find(params[:id])
    receipt = Receipt.new
    receipt.user = current_user
    receipt.item = item
    if receipt.save
      redirect_to receipt_path(receipt)
    else
      render :index, status: :unprocessable_entity
    end
  end
end
