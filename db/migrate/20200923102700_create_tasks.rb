class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :issue, null: false, foreign_key: true
      t.string :title, null: false
      t.datetime :start, null: false
      t.time :time, null: false
      t.text :content

      t.timestamps
    end
  end
end
