class CreateStrikes < ActiveRecord::Migration
  def change
    create_table :strikes do |t|
      t.integer :person_id

      t.timestamps
    end
  end
end
