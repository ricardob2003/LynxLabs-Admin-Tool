class RenameBitacoraDelProyectoToDetallesDelProyecto < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :detalles_del_proyecto, :detalles_del_proyecto
  end
end
