class AddDeletedToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :deleted, :boolean
  end
end
