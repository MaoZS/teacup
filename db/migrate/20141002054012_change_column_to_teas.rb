class ChangeColumnToTeas < ActiveRecord::Migration
  def change
    change_table :teas do |t|
      t.change(:date,:string)
    end
  end
end
