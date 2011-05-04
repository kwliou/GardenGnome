class Garden < ActiveRecord::Base

  has_many :photos, :dependent => :destroy 
  has_many :plots, :dependent => :destroy
  validates_uniqueness_of :name, :scope => [:city, :state]

  def stub
    [id.to_s, name, city, state, is_public.to_s, password]
  end

end
