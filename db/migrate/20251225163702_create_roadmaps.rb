class CreateRoadmaps < ActiveRecord::Migration[8.1]
  def change
    create_table :roadmaps do |t|
      t.string :course_one
      t.string :course_two
      t.string :course_three
      t.string :course_four
      t.string :course_five

      t.decimal :rating_one, precision: 3, scale: 3
      t.decimal :rating_two, precision: 3, scale: 3
      t.decimal :rating_three, precision: 3, scale: 3
      t.decimal :rating_four, precision: 3, scale: 3
      t.decimal :rating_five, precision: 3, scale: 3
      
      t.timestamps
    end
  end
end
