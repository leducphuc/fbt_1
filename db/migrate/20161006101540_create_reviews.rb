class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.string :image
      t.integer :number,default: 0

      t.timestamps
    end
  end
end
