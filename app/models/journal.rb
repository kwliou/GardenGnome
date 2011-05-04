class Journal < ActiveRecord::Base
  belongs_to :plant
  
  def as_json(options={})
    revised = super(options)
    revised["created_at"] = (created_at.to_f * 1000).to_i # return created_at as milliseconds
    return revised
  end
end
