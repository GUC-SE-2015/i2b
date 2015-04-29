class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
