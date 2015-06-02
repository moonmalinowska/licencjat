class StaticPagesController < ApplicationController
  def home
  end

  def tips
    @attractions=Attraction.all
  end

  def trips
    @attractions=Attraction.all
   # @attraction = Attraction.find(params[:id])
  end

  def fairs
    @attractions=Attraction.all
  end

  def museums
    @attractions=Attraction.all
  end

  def search
  end
end
