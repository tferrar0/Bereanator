class CreateOccurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :occurrences do |t|
      t.integer :instruction_id
      t.text :text
      t.integer :book_id
      t.integer :chapter
      t.integer :verse

      t.timestamps
    end
  end
end
