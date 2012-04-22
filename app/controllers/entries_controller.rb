class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    @emails = @entries.map(&:email).join(",")
  end

  def new
  end

  def create
    @entry = Entry.create(:name => params[:name], :email => params[:email])
    unless params[:tags].nil?
      params[:tags].each do |tagging|
        @tag = Tag.find_by_name(tagging)
        Tagging.create( :entry_id => @entry.id, :tag_id => @tag.id)
      end
    end
    if @entry.save
      redirect_to root_path, :notice => "New Entry added."
    else
      render :new
    end
  end
  
  def browse
    @entries = Array.new
    unless params[:browse].nil?
      params[:browse].each do |tag|
        @tags = Tag.find_by_name(tag)
        @tags.entries.each do |entry|
          @entries << entry
        end
      end
    else
      @entries = Entry.all
    end
      @entries = @entries.uniq
      @emails = @entries.map(&:email).join(",")
    respond_to do |format|
      format.js
      format.html { redirect_to root_path}
    end
  end
  
  def search
    @entries = Entry.where("name LIKE (?) OR email LIKE (?)", "%#{params[:input]}%", "%#{params[:input]}%")
    @emails = @entries.map(&:email).join(",")
    respond_to do |format|
      format.js
      format.html { redirect_to root_path}
    end
  end
  
  def destroy
    @entry = Entry.find params[:id]
    @entry.destroy
    @entries = Entry.all
    @emails = @entries.map(&:email).join(",")
    respond_to do |format|
      format.js
      format.html { redirect_to root_path}
    end
  end

end
