class CreateHashtagPostos < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_postos do |t|
      t.references :posto, foreign_key: true
      t.references :hashtag, foreign_key: true
      t.timestamps
    end
  end
end
