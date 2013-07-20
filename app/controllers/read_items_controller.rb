class ReadItemsController < ApplicationController
  
  before_filter :authorize

  # POST /read_items
  # POST /read_items.json
  def create
    @read_item = ReadItem.new(params[:read_item])
    existing_item = ReadItem.find_by_item_id_and_feed_id(params[:read_item][:item_id], params[:read_item][:feed_id])
    respond_to do |format|
      if existing_item != nil
        format.json { render json: existing_item, status: 409 }
      elsif  @read_item.save
        format.json { render :nothing => true, status: :created }
        format.html { render :nothing => true, status: :created }
      else
        format.json { render json: @read_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
