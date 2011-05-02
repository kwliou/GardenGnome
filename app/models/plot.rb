class Plot < ActiveRecord::Base
  belongs_to :garden
  has_many :plants

end
