class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :content
      t.references :conversation, type: :uuid, index: true, foreign_key: { on_delete: :cascade }
      t.references :user, type: :uuid, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :read, :default => false
      t.timestamps
    end
  end
end