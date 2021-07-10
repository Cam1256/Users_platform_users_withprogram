class CreateEstudiantes < ActiveRecord::Migration[6.1]
  def change
    create_table :estudiantes do |t|
      t.string :nombre, null: false
      t.string :apellido, null: false
      t.string :identificacion, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :programa, null: false

      t.timestamps
    end
  end
end
