class MaterialProcurementsController < ApplicationController
  # GET /material_procurements
  # GET /material_procurements.json
  def index
    @project = Project.find(params[:project_id])
    @material_procurements = @project.material_procurements

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_procurements }
    end
  end

  # GET /material_procurements/1
  # GET /material_procurements/1.json
  def show
    @project = Project.find(params[:project_id])
    @material_procurement = MaterialProcurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_procurement }
    end
  end

  # GET /material_procurements/new
  # GET /material_procurements/new.json
  def new
    @project = Project.find(params[:project_id])
    @material_procurement = MaterialProcurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_procurement }
    end
  end

  # GET /material_procurements/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @material_procurement = MaterialProcurement.find(params[:id])
  end

  # POST /material_procurements
  # POST /material_procurements.json
  #FIXME calculate totals for purchases
  #FIXME add the total of units and avg price of the material
  def create
    @project = Project.find(params[:project_id])
    @material_procurement = @project.material_procurements.build(params[:material_procurement].except(:material_id))
    @material_procurement.material = Material.find(params[:material_procurement][:material_id])
    #@material_procurement.calulate_total_cost(params[:material_procurement][:quantity], params[:material_procurement][:price_per_unit])

    respond_to do |format|
      if @material_procurement.save

        format.html { redirect_to [@project, @material_procurement], notice: 'Material procurement was successfully created.' }
        format.json { render json: @material_procurement, status: :created, location: @material_procurement }
      else
        format.html { render action: "new" }
        format.json { render json: @material_procurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_procurements/1
  # PUT /material_procurements/1.json
  def update
    @project = Project.find(params[:project_id])
    @material_procurement = MaterialProcurement.find(params[:id])

    respond_to do |format|
      if @material_procurement.update_attributes(params[:material_procurement].except(:material_id))
        format.html { redirect_to [@project, @material_procurement], notice: 'Material procurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_procurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_procurements/1
  # DELETE /material_procurements/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @material_procurement = MaterialProcurement.find(params[:id])
    @material_procurement.destroy

    respond_to do |format|
      format.html { redirect_to project_material_procurements_path(@project) }
      format.json { head :no_content }
    end
  end
end
