class StaticPagesController < ApplicationController

  skip_authorization_check
  include VarietiesHelper

  def home
    @categories= Category.all
  end

  def tips
    @categories= Category.all
    @attractions=Attraction.all
  end

  def trips
    @variety = Variety.find_by_id(1)

    @attractions=Attraction.all
    @varieties=Variety.all

    @categories= Category.all
    #@attractions= @attractions.variety.name
   # @attraction = Attraction.find(params[:id])
   # @attr = @varieties.attractions



  end

  def fairs
    @variety = Variety.find_by_id(3)
    @categories= Category.all
    @attractions=Attraction.all
  end

  def museums
    @variety = Variety.find_by_id(2)
    @categories= Category.all
    @attractions=Attraction.all
  end

  def search
    @categories= Category.all
  end

  def search_model
    binding.pry
    @category = Category.search(params[:id])
  end
end
