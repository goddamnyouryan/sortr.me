class TagsController < ApplicationController
  def create
    @tag = Tag.create(params[:tag])
    if @tag.save
      redirect_to root_path, :notice => "New Tag Added. Now Tag some people with it by dragging tags to their name."
    else
      render :new
    end
  end

  def destroy
    @tag = Tag.find params[:id]
    @taggings = Tagging.where("tag_id = ?", @tag.id)
    unless @taggings.empty?
      @taggings.each do |tagging|
        tagging.destroy
      end
    end
    @tag.destroy
    flash[:notice] = "Blam, you destroyed that tag.  Hopefully no one who was tagged with it minds!"
  end
  
end
