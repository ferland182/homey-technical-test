class StatusChangesController < ApplicationController
  before_action :set_project, only: %i[index]

  def index
    @status_changes = @project.status_changes
  end

  def create
    @status_change = StatusChange.new(status_change_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @status_change.save
        format.turbo_stream do
          head :no_content
        end
        format.html { redirect_to @project, notice: "Status change added successfully!" }
      else
        redirect_to @project, notice: "An error occurred!"
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def status_change_params
    params.permit(:status, :project_id)
  end
end
