class Strike < ActiveRecord::Base
  belongs_to :person
  
  validates :person, presence: true
  validates :reason, presence: true
end
