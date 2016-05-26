class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :completed, default: false
      t.integer :priority, default: 0
      t.date :completed_date

      t.belongs_to :list

      t.timestamps null: false
    end
  end
end
