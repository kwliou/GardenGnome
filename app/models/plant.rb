class Plant < ActiveRecord::Base
  belongs_to :plot
  has_many :journals
end
