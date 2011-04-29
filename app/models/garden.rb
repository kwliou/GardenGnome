class Garden < ActiveRecord::Base

  has_many :photos 
  validates_uniqueness_of :name, :scope => [:city, :state]

  def stub
    [id.to_s, name, city, state]
  end

end
