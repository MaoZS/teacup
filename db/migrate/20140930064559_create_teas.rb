class CreateTeas < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.string :name
      t.string :title
      t.text :text
      t.timestamp :date
      t.string :code

      t.timestamps
    end
  end
end
