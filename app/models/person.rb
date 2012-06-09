class Person < ActiveRecord::Base
  has_many :strikes
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
  def as_json(options = {})
    super(options.merge(include: :strikes))
  end
end
