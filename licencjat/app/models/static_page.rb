class StaticPage < ActiveRecord::Base


  def random
    offset(rand(count))
  end

  def get_random
    Attraction.limit(5).order("RANDOM()")
  end
end
