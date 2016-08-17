class CreatePunchcards < ActiveRecord::Migration
  def change
    create_table :punchcards do |t|
      t.integer :user_id
      t.datetime :logged_time
      t.string :task
      t.text :notes

      t.timestamps null: false
    end
  end
end
