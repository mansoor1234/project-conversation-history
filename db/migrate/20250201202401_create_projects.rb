class CreateProjects < ActiveRecord::Migration[8.0]
  def up
    create_table :projects do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end

  def down
    drop_table :projects
  end

end
