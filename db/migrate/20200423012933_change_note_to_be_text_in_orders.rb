class ChangeNoteToBeTextInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :note, :text
  end
end
