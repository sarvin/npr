class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :display_name
      t.integer :api_id
      t.timestamp :date_updated

      t.timestamps null: false
    end
  end
end
