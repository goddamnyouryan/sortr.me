class TaggingsController < ApplicationController
  def create
    @tag = Tag.find_by_name(params[:tag])
    @entry = Entry.find params[:entry]
    unless @entry.tags.include?(@tag)
      Tagging.create( :entry_id => @entry.id, :tag_id => @tag.id)
      respond_to do |format|
        format.js
        format.html { redirect_to root_path}
      end
    else
      return false
    end
  end

  def destroy
    @tagging = Tagging.find params[:id]
    @entry = @tagging.entry
    @tagging.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path}
    end
  end
end
