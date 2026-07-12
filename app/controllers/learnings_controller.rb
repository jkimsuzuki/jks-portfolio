class LearningsController < ApplicationController
  def create
    @learning = Learning.new(learning_params)
    @learning.progress ||= 0
    if @learning.save
      redirect_to learnings_path, notice: "Resource added."
    else
      redirect_to learnings_path, alert: "Could not save resource."
    end
  end

  def destroy
    @learning = Learning.find(params[:id])
    @learning.destroy
    redirect_to learnings_path, notice: "Resource deleted."
  end

  private

  def learning_params
    params.require(:learning).permit(:name, :resource_type, :topic, :description, :url, :progress)
  end
end
