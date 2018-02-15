class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end