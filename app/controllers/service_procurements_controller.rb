class ServiceProcurementsController < ApplicationController
  # GET /service_procurements
  # GET /service_procurements.json
  def index
    @project = Project.find(params[:project_id])
    @service_procurements = @project.service_procurements

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_procurements }
    end
  end

  # GET /service_procurements/1
  # GET /service_procurements/1.json
  def show
    @project = Project.find(params[:project_id])
    @service_procurement = ServiceProcurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service_procurement }
    end
  end

  # GET /service_procurements/new
  # GET /service_procurements/new.json
  def new
    @project = Project.find(params[:project_id])
    @service_procurement = ServiceProcurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service_procurement }
    end
  end

  # GET /service_procurements/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @service_procurement = ServiceProcurement.find(params[:id])
  end

  # POST /service_procurements
  # POST /service_procurements.json
  def create
    @project = Project.find(params[:project_id])
    @service_procurement = @project.service_procurements.build(params[:service_procurement].except(:service_id, :phase_id))
    @service_procurement.service = Service.find(params[:service_procurement][:service_id])
    @service_procurement.phase = Phase.find(params[:service_procurement][:phase_id])

    respond_to do |format|
      if @service_procurement.save
        format.html { redirect_to [@project, @service_procurement], notice: 'Service procurement was successfully created.' }
        format.json { render json: @service_procurement, status: :created, location: @service_procurement }
      else
        format.html { render action: "new" }
        format.json { render json: @service_procurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /service_procurements/1
  # PUT /service_procurements/1.json
  def update
    @project = Project.find(params[:project_id])
    @service_procurement = ServiceProcurement.find(params[:id])

    respond_to do |format|
      if @service_procurement.update_attributes(params[:service_procurement].except(:service_id, :phase_id))
        format.html { redirect_to [@project, @service_procurement], notice: 'Service procurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service_procurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_procurements/1
  # DELETE /service_procurements/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @service_procurement = ServiceProcurement.find(params[:id])
    @service_procurement.destroy

    respond_to do |format|
      format.html { redirect_to project_service_procurements_url }
      format.json { head :no_content }
    end
  end
end
