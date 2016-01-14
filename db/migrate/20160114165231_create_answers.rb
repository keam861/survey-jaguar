class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :choice  
      t.belongs_to :question
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
