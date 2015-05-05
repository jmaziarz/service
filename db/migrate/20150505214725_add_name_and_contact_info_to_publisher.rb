class AddNameAndContactInfoToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :name, :string
    add_column :publishers, :username, :string
    add_column :publishers, :email, :string
    add_column :publishers, :telephone, :string
    add_column :publishers, :is_texting, :boolean
  end
end
