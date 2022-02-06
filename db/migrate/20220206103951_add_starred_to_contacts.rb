class AddStarredToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :starred, :boolean
  end
end
