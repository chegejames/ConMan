class MaterialUsagesController < ApplicationController
  # GET /material_usages
  # GET /material_usages.json
  def index
    @project = Project.find(params[:project_id])
    @material_usages = @project.material_usages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_usages }
    end
  end

  # GET /material_usages/1
  # GET /material_usages/1.json
  def show
    @project = Project.find(params[:project_id])
    @material_usage = @project.material_usages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_usage }
    end
  end

  # GET /material_usages/new
  # GET /material_usages/new.json
  def new
    @project = Project.find(params[:project_id])
    @material_usage = MaterialUsage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_usage }
    end
  end

  # GET /material_usages/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @material_usage = @project.material_usages.find(params[:id])
  end

  # POST /material_usages
  # POST /material_usages.json
  def create
    @project = Project.find(params[:project_id])
    @material_usage = @project.material_usages.build(params[:material_usage].except(:material_id, :phase_id))
    @material_usage.material = @project.materials.find_by_id(params[:material_usage][:material_id])
    @material_usage.phase = @project.phases.find_by_id(params[:material_usage][:phase_id])

    respond_to do |format|
      if @material_usage.save
        format.html { redirect_to [@project, @material_usage], notice: 'Material usage was successfully created.' }
        format.json { render json: @material_usage, status: :created, location: @material_usage }
      else
        format.html { render action: "new" }
        format.json { render json: @material_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_usages/1
  # PUT /material_usages/1.json
  def update
    @project = Project.find(params[:project_id])
    @material_usage = @project.material_usages.find(params[:id])
    @material_usage.material = @project.materials.find_by_id(params[:material_usage][:material_id])
    @material_usage.phase = @project.phases.find_by_id(params[:material_usage][:phase_id])

    respond_to do |format|
      if @material_usage.update_attributes(params[:material_usage].except(:material_id, :phase_id))
        format.html { redirect_to [@project, @material_usage], notice: 'Material usage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_usages/1
  # DELETE /material_usages/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @material_usage = @project.material_usages.find(params[:id])
    @material_usage.destroy

    respond_to do |format|
      format.html { redirect_to project_material_usages_path(@project) }
      format.json { head :no_content }
    end
  end
end
