class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.references :product, null: false, foreign_key: true
      t.string :summary, null: false
      t.text :description

      t.timestamps
    end
  end
end
