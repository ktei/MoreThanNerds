class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.string :email
      t.text :content
      t.datetime :created_at
    end
    add_index :messages, :created_at
  end
end
