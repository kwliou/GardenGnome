class Garden < ActiveRecord::Base

  has_many :photos 
  validates_uniqueness_of :name, :scope => [:city, :state]

  def stub
    [name, city, state]
  end

end
