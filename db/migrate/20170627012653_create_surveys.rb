class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :student_email
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4
      t.string :question5
      t.string :question6
      t.string :question7
      t.string :question8
      t.string :question9
      t.text :question10
      t.text :question11
      t.text :question12
      t.text :question13

      t.timestamps
    end
  end
end
