class Record < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :amount, null: false
      t.integer :category, limit: 1, null: false
      t.string :notes
      t.timestamps
    end
    
  end
end
