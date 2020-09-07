class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :year
      t.integer :consecutive
      t.string  :identificator
      t.references :user
      t.text    :message
      t.text    :response
      t.timestamps
    end
  end
end
