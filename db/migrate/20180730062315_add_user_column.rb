class AddUserColumn < ActiveRecord::Migration[5.2]
  def change
    
    add_column    :users, :first_name, :string
    add_column    :users, :last_name, :string

  	add_reference :posts, :user
  	add_reference :comments, :user
  end
end
