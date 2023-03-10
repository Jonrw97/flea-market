class ItemsController < ApplicationController
  def index
    if params[:query].present?
      items = Item.search_by_item_name_and_description(params[:query])
    else
      items = Item.all
    end
    @sorted_items = items.select { |item| item.receipt.nil?}
  end

  def show
    @item = Item.find(params[:id])
    users = User.where("id = ? or id = ?", @item.user.id, current_user.id)

    @markers = users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "_info_window", locals: { user: }),
        marker_html: render_to_string(partial: "marker", locals: { user: })
      }
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    render :edit, status: :unprocessable_entity unless current_user == @item.user
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if current_user == @item.user # 1

    redirect_to items_path, status: :see_other
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :photo)
  end
end
