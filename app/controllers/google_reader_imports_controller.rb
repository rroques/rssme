class GoogleReaderImportsController < ApplicationController

  before_filter :authorize

  include GoogleImporter

  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    respond_to do |format|
      if import_from_google(params[:google_reader_import][:file])
        format.html { redirect_to feeds_url, notice: 'Import was successfully ' }
        format.json { render json: @feed, status: :created, location: @google_import }
      else
        format.html { render action: "new" }
        format.json { render json: @google_import.errors, status: :unprocessable_entity }
      end
    end

  end


end
