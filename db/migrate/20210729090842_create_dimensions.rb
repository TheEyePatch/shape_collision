class CreateDimensions < ActiveRecord::Migration[6.1]
  def change
    create_table :dimensions do |t|
      t.belongs_to :rectangle
      t.float :height
      t.float :width
      t.timestamps
    end
  end
end
