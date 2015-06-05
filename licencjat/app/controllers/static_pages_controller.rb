class StaticPagesController < ApplicationController
  def home
    @categories= Category.all
  end

  def tips
    @categories= Category.all
    @attractions=Attraction.all
  end

  def trips
    @categories= Category.all
    @attractions=Attraction.all
    @varieties=Variety.all
    @variety=Variety.find(1)
   # @attraction = Attraction.find(params[:id])
  end

  def fairs
    @categories= Category.all
    @attractions=Attraction.all
  end

  def museums
    @categories= Category.all
    @attractions=Attraction.all
  end

  def search
    @categories= Category.all
  end
end
