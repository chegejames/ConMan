class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
    @project = Project.find(params[:project_id])
    @services = @project.services.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @project = Project.find(params[:project_id])
    @service = @project.services.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @project = Project.find(params[:project_id])
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @service = @project.services.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @project = Project.find(params[:project_id])
    @service = @project.services.build(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to [@project, @service], notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @project = Project.find(params[:project_id])
    @service = @project.services.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to [@project, @service], notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @service = @project.services.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to project_services_path(@project) }
      format.json { head :no_content }
    end
  end
end
