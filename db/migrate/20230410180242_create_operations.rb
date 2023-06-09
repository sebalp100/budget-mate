class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :name
      t.decimal :amount, default: 0
      t.references :category, null: false, foreign_key: true
      t.references :author, foreign_key: { to_table: 'users', name: 'author_id' }

      t.timestamps
    end
  end
end
