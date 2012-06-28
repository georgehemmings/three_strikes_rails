class Strike < ActiveRecord::Base
  attr_accessible :when, :reason, :person_id
  
  belongs_to :person
  
  validates :person, presence: true
  validates :reason, presence: true
  validates :reason, length: { maximum: 255 }
  
  default_scope { order('created_at ASC') }
end
