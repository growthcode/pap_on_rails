class CreatePapActions < ActiveRecord::Migration
  def change
    create_table :pap_actions do |t|
      t.string :acting_person_title
      t.string :acting_person
      t.string :action_statement #=> the action statement
      t.text :description  #=> the details
      t.integer :priority
      t.integer :position #=> for sorting dynamically
      t.string :state_of_action #=> is this state of action (complete, building, not ready, ect.)

      t.belongs_to  :project
      t.timestamps
    end
    add_index :pap_actions, :project_id
    add_index :pap_actions, :position
    add_index :pap_actions, :acting_person_title
    add_index :pap_actions, :acting_person
    add_index :pap_actions, :priority
    add_index :pap_actions, :state_of_action
  end
end
