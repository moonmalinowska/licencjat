class TagController < ApplicationController
  authorize_resource only: [:update, :delete, :edit]

  def show
    @tag = Tag.find(params[:id])
    @attractions = Attraction.tagged_with(@tag.name)
    @categories = Category.all
  end
end
