class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
