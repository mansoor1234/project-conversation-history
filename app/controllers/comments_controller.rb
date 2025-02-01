class CommentsController < ApplicationController
    # before_action :authenticate_user!
  
    def create
      @project = Project.find(params[:project_id])
      @project.comments.create!(content: params[:comment][:content], user: current_user)
      redirect_to @project
    end
end