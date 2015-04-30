class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :Answerer
      t.text :body
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :posts
  end
end
