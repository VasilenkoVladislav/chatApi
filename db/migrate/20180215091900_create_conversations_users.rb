class CreateConversationsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :conversation_users do |t|
      t.references :conversation, type: :uuid, index: true, foreign_key: { on_delete: :cascade }
      t.references :user, type: :uuid, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :is_deleted, :default => false
    end
  end
end