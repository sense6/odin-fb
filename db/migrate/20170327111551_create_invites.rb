class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.index [:sender_id, :recever_id], unique: true

      t.timestamps
    end
  end
end
