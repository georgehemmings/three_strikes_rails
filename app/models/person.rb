class Person < ActiveRecord::Base
  has_many :strikes
  
  def as_json(options = {})
    super(options.merge(methods: :strikes_count))
  end
  
  def strikes_count
    strikes.length
  end
end
