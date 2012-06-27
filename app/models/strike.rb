class Strike < ActiveRecord::Base
  attr_accessible :reason, :person_id
  
  belongs_to :person
  
  validates :person, presence: true
  validates :reason, presence: true
  
  default_scope { order('created_at ASC') }
end
