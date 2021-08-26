class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :rent
      t.integer :age
      t.string :address
      t.string :remark

      t.timestamps
    end
  end
end
