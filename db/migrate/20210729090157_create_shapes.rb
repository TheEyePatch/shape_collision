class CreateShapes < ActiveRecord::Migration[6.1]
  def change
    create_table :shapes do |t|
      t.string :type
      t.float :x
      t.float :y
      t.float :area
      t.timestamps
    end
  end
end
