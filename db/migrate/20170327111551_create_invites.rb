class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :recever_id

      t.timestamps
    end
  end
end