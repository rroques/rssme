class FeedsController < ApplicationController

  before_filter :authorize

  before_filter :find_feed_for_current_user,   only: [:destroy, :edit, :update, :show, :mark_all_read]

  
  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = current_user.feeds.order("name ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feed = Feed.find(params[:id])
    
    respond_to do |format|
      # format.html # show.html.erb
      format.js
      format.json { render json: @feed }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.json
  def new
    @feed = current_user.feeds.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feed }
      format.js
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = current_user.feeds.new(params[:feed])

    respond_to do |format|
      if @feed.save
        format.html { redirect_to feeds_url, notice: 'Feed was successfully created.' }
        format.json { render json: @feed, status: :created, location: @feed }
      else
        format.html { render action: "new" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_all_read
    read_item_ids = @feed.read_items.map(&:item_id)
    @feed.items.each do |e|
      if not read_item_ids.include? e.id 
        ReadItem.new({:feed_id => @feed.id, :item_id => e.id}).save
      end  
    end 
    respond_to do |format|
      format.js { render 'show'}
      format.json { render 'show'}
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.json
  def update

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        format.html { redirect_to feeds_url , notice: 'Feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end

  private

    def find_feed_for_current_user
      @feed = current_user.feeds.find_by_id(params[:id])
      redirect_to root_url if @feed.nil?
    end
end
