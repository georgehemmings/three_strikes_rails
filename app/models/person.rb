class Person < ActiveRecord::Base
  has_many :strikes
  
  def as_json(options = {})
    super(options.merge(include: :strikes))
  end
end
