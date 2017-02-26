class CreatePostcards < ActiveRecord::Migration
  def change
    create_table :postcards do |t|
      t.string :title 
      t.string :body, null: false
      t.string :description, null: false
      t.string :short_description, null:false
      t.belongs_to :category, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
