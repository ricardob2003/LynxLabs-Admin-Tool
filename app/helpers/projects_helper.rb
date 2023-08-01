module ProjectsHelper
  def display_project_errors(project)
    if project.errors.any?
      pluralized_errors = pluralize(project.errors.count, "errore")
      "Se presentaron #{pluralized_errors} que impidieron que el proyecto se agregara al inventario."
    end
  end
end
