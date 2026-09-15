module ApplicationHelper
  def experiment_thumbnail(experiment)
    filename = "#{experiment.name.parameterize}-preview.png"
    filename if Rails.root.join("app/assets/images", filename).exist?
  end
end
