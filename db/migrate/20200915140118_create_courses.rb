class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :number
      t.integer :hours
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
