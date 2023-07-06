class AddFieldsToProyecto < ActiveRecord::Migration[7.0]
  def change
    add_column :proyectos, :bitacora_del_proyecto, :text
    add_column :proyectos, :cliente, :string
  end
end
