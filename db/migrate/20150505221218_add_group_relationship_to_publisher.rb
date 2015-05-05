class AddGroupRelationshipToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :group_id, :integer
  end
end
