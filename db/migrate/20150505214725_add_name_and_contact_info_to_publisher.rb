class AddNameAndContactInfoToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :last_name, :string
    add_column :publishers, :first_name, :string
    add_column :publishers, :middle_name, :string
    add_column :publishers, :username, :string
    add_column :publishers, :email, :string
    add_column :publishers, :telephone, :string
    add_column :publishers, :is_texting, :boolean
  end
end
