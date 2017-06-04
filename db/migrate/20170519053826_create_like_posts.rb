class CreateLikePosts < ActiveRecord::Migration
  def change
    create_table :like_posts do |t|
      t.integer :user_id , null: false
      t.integer :poster_id, null: false
      t.timestamps null: false
    end
  end
end
