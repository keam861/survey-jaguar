class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :user
      t.string :survey_name
      
      t.timestamps null: false
    end
  end
end
