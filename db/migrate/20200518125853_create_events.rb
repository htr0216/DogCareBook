class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.string :category, limit: 10, null: true
      t.datetime :start_at
      t.datetime :end_at
      t.references :user

      t.timestamps
    end
  end
end
