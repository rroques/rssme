class ReadItemsController < ApplicationController
  
  # before_create :check_join_exists

  # GET /read_items
  # GET /read_items.json
  def index
    @read_items = ReadItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @read_items }
    end
  end

  # GET /read_items/1
  # GET /read_items/1.json
  def show
    @read_item = ReadItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @read_item }
    end
  end

  # GET /read_items/new
  # GET /read_items/new.json
  def new
    @read_item = ReadItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @read_item }
    end
  end

  # GET /read_items/1/edit
  def edit
    @read_item = ReadItem.find(params[:id])
  end

  # POST /read_items
  # POST /read_items.json
  def create
    @read_item = ReadItem.new(params[:read_item])
    existing_item = ReadItem.find_by_item_id_and_feed_id(params[:read_item][:item_id], params[:read_item][:feed_id])
    respond_to do |format|
      if existing_item != nil
        format.json { render json: existing_item, status: 409 }
      elsif  @read_item.save
        # format.html { redirect_to @read_item, notice: 'Read item was successfully created.' }
        format.json { render json: @read_item, status: :created }
      else
        format.json { render json: @read_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /read_items/1
  # PUT /read_items/1.json
  def update
    @read_item = ReadItem.find(params[:id])

    respond_to do |format|
      if @read_item.update_attributes(params[:read_item])
        format.html { redirect_to @read_item, notice: 'Read item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @read_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /read_items/1
  # DELETE /read_items/1.json
  def destroy
    @read_item = ReadItem.find(params[:id])
    @read_item.destroy

    respond_to do |format|
      format.html { redirect_to read_items_url }
      format.json { head :no_content }
    end
  end

  private

  
end
