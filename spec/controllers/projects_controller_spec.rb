require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  # Create a user and a project using factories
  let(:user) { FactoryBot.create(:user) }
  let!(:project) { FactoryBot.create(:project, status: "Pending") }

  # Stub current_user for the controller
  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "assigns all projects as @projects" do
      get :index
      expect(assigns(:projects)).to eq([project])
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project and its comments ordered by created_at" do
      # Create a couple of comments so that ordering can be tested.
      comment1 = FactoryBot.create(:comment, project: project, user: user, created_at: 2.days.ago)
      comment2 = FactoryBot.create(:comment, project: project, user: user, created_at: 1.day.ago)
      
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
      expect(assigns(:comments)).to eq([comment1, comment2])
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH #update_status" do
    context "when the update is successful" do
      it "updates the project status, creates a comment, and redirects to the project" do
        patch :update_status, params: { id: project.id, status: "In Progress" }
        project.reload
        expect(project.status).to eq("In Progress")
        
        # Ensure a comment is created with the correct message and user
        comment = Comment.last
        expect(comment.project).to eq(project)
        expect(comment.content).to eq("Status changed to In Progress")
        expect(comment.user).to eq(user)
        
        expect(response).to redirect_to(project)
        expect(flash[:notice]).to eq('Project status updated.')
      end
    end

    context "when the update fails" do
      it "renders the show template" do
        # Force update to fail by stubbing update to return false
        allow_any_instance_of(Project).to receive(:update).and_return(false)
        patch :update_status, params: { id: project.id, status: "updated" }
        expect(response).to render_template(:show)
      end
    end
  end
end
