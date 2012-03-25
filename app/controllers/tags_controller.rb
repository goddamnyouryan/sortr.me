class TagsController < ApplicationController
  def create
    @tag = Tag.create(params[:tag])
    if @tag.save
      redirect_to root_path, :notice => "New Tag Added."
    else
      render :new
    end
  end

  def destroy
    @entry = Entry.find params[:entry]
    @tag = Tag.find params[:id]
    @tagging = Tagging.find_by_tag_id_and_entry_id(@tag.id, @entry.id)
    @tagging.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path}
    end
  end
  
end
