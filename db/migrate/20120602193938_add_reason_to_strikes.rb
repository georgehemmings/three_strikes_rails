class AddReasonToStrikes < ActiveRecord::Migration
  def change
    add_column :strikes, :reason, :string

  end
end
