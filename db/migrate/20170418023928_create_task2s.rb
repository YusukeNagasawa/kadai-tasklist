class CreateTask2s < ActiveRecord::Migration[5.0]
  def change
    create_table :task2s do |t|
      t.string :status
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
