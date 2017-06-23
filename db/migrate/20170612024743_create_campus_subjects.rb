class CreateCampusSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :campus_subjects do |t|
      t.integer :campus_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
