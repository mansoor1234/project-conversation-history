class ProjectsController < ApplicationController
    # before_action :authenticate_user!
  
    def index
      @projects = Project.all
    end
   
    def show
      @project = Project.find(params[:id])
      @comments = @project.comments.order(created_at: :asc)
    end
  
    def update_status
      @project = Project.find(params[:id])
      if @project.update(status: params[:status])
        Comment.create!(project: @project, content: "Status changed to #{params[:status]}", user: current_user)
        redirect_to @project, notice: 'Project status updated.'
      else
        render :show
      end
    end
end