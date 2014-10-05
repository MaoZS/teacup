class ChangeColumnToDeleted < ActiveRecord::Migration
  def change
    change_table :teas do |t|
      t.change(:deleted,:boolean,null:false,default:false)
    end
  end
end
