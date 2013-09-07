class LabourersController < ApplicationController
  # GET /labourers
  # GET /labourers.json
  def index
     @project = Project.find(params[:project_id])
    @labourers = @project.labourers.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labourers }
    end
  end

  # GET /labourers/1
  # GET /labourers/1.json
  def show
     @project = Project.find(params[:project_id])
    @labourer = Labourer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @labourer }
    end
  end

  # GET /labourers/new
  # GET /labourers/new.json
  def new
     @project = Project.find(params[:project_id])
    @labourer = Labourer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @labourer }
    end
  end

  # GET /labourers/1/edit
  def edit
     @project = Project.find(params[:project_id])
    @labourer = Labourer.find(params[:id])
  end

  # POST /labourers
  # POST /labourers.json
  def create
     @project = Project.find(params[:project_id])
    @labourer = @project.labourers.build(params[:labourer])

    respond_to do |format|
      if @labourer.save
        format.html { redirect_to [@project, @labourer], notice: 'Labourer was successfully created.' }
        format.json { render json: [@project, @labourer], status: :created, location: @labourer }
      else
        format.html { render action: "new" }
        format.json { render json: @labourer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /labourers/1
  # PUT /labourers/1.json
  def update
     @project = Project.find(params[:project_id])
    @labourer = Labourer.find(params[:id])

    respond_to do |format|
      if @labourer.update_attributes(params[:labourer])
        format.html { redirect_to [@project, @labourer], notice: 'Labourer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @labourer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labourers/1
  # DELETE /labourers/1.json
  def destroy
     @project = Project.find(params[:project_id])
    @labourer = Labourer.find(params[:id])
    @labourer.destroy

    respond_to do |format|
      format.html { redirect_to project_labourers_path(@project) }
      format.json { head :no_content }
    end
  end
end
