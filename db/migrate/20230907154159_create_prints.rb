class CreatePrints < ActiveRecord::Migration[7.0]
  def change
    create_table :prints do |t|
      t.integer :user_id
      t.binary :file
      t.integer :status
      t.string :title
      t.string :detail
      t.integer :grade
      t.string :subject

      t.timestamps
    end
  end
end
