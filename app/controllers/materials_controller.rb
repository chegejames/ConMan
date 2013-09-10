class MaterialsController < ApplicationController
  # GET /materials
  # GET /materials.json
  def index
    @project = Project.find(params[:project_id])
    @materials = @project.materials

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materials }
    end
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    @project = Project.find(params[:project_id])
    @material = @project.materials.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material }
    end
  end

  # GET /materials/new
  # GET /materials/new.json
  def new
    @project = Project.find(params[:project_id])
    @material = Material.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material }
    end
  end

  # GET /materials/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @material = @project.materials.find(params[:id])
  end

  # POST /materials
  # POST /materials.json
  def create
    @project = Project.find(params[:project_id])
    @material = @project.materials.build(params[:material])

    respond_to do |format|
      if @material.save
        format.html { redirect_to [@project, @material], notice: 'Material was successfully created.' }
        format.json { render json: @material, status: :created, location: @material }
      else
        format.html { render action: "new" }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /materials/1
  # PUT /materials/1.json
  def update
    @project = Project.find(params[:project_id])
    @material = @project.materials.find(params[:id])

    respond_to do |format|
      if @material.update_attributes(params[:material])
        format.html { redirect_to [@project, @material], notice: 'Material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @material = @project.materials.find(params[:id])
    @material.destroy

    respond_to do |format|
      format.html { redirect_to project_materials_path(@project) }
      format.json { head :no_content }
    end
  end
end
