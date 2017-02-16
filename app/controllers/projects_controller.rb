class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all.order("created_at desc")
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project, notice: "Project successfully saved"
		else
			render 'new', notice: "Unable to save project"
		end
	end

	def show
	end

	private

	def project_params
		params.require(:project).permit(:title, :description, :link)
	end

	def find_project
		@project = Project.find(params[:id])
	end

end
