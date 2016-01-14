class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.belongs_to :question
      t.text :choice

      t.timestamps null: false
    end
  end
end
