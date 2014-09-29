class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.belongs_to  :user

      t.timestamps
    end
  add_index :projects, :user_id
  add_index :projects, :project_name
  end
end
