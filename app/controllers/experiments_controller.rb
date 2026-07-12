class ExperimentsController < ApplicationController
  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.experiment_date = Date.today if @experiment.experiment_date.blank?
    if @experiment.save
      redirect_to experiments_path, notice: "Experiment added."
    else
      redirect_to experiments_path, alert: "Could not save experiment."
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy
    redirect_to experiments_path, notice: "Experiment deleted."
  end

  private

  def experiment_params
    params.require(:experiment).permit(:name, :description, :status, :url, :experiment_date)
  end
end
