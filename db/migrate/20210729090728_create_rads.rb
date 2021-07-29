class CreateRads < ActiveRecord::Migration[6.1]
  def change
    create_table :rads do |t|
      t.belongs_to :circle
      t.float :value
      t.timestamps
    end
  end
end
