class Person < ActiveRecord::Base
  attr_accessible :name
  
  has_many :strikes, dependent: :destroy
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 255 }
  
  default_scope { order('name ASC') }
  
  def as_json(options = {})
    super(options.merge(include: :strikes))
  end
end
