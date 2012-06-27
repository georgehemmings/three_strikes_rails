class Person < ActiveRecord::Base
  has_many :strikes
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
  default_scope { order('name ASC') }
  
  def as_json(options = {})
    super(options.merge(include: :strikes))
  end
end
