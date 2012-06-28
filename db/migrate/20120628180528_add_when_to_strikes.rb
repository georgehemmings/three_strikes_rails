class AddWhenToStrikes < ActiveRecord::Migration
  def change
    add_column :strikes, :when, :datetime
    Strike.update_all(when: DateTime.now)
  end
end
