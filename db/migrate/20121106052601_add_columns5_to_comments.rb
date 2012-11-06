class AddColumns5ToComments < ActiveRecord::Migration
  def change
    add_column :comments, :c_approval_status, :integer
  end
end
