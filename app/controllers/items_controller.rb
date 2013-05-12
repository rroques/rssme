class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    
    respond_to do |format|
      # format.html # show.html.erb
      format.js
      format.json { render json: @item }
    end
  end

end
