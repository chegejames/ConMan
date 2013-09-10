class WagesController < ApplicationController
  # GET /wages
  # GET /wages.json
  def index
    @project = Project.find(params[:project_id])
    @wages = @project.wages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wages }
    end
  end

  # GET /wages/1
  # GET /wages/1.json
  def show
    @project = Project.find(params[:project_id])
    @wage = @project.wages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wage }
    end
  end

  # GET /wages/new
  # GET /wages/new.json
  def new
    @project = Project.find(params[:project_id])
    @wage = Wage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wage }
    end
  end

  # GET /wages/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @wage = @project.wages.find(params[:id])
  end

  # POST /wages
  # POST /wages.json
  def create
    @project = Project.find(params[:project_id])
    @wage = @project.wages.build(params[:wage].except(:labourer_id, :phase_id))
    @wage.labourer = @project.labourers.find_by_id(params[:wage][:labourer_id])
    @wage.phase = @project.phases.find_by_id(params[:wage][:phase_id])

    respond_to do |format|
      if @wage.save
        format.html { redirect_to [@project, @wage], notice: 'Wage was successfully created.' }
        format.json { render json: @wage, status: :created, location: @wage }
      else
        format.html { render action: "new" }
        format.json { render json: @wage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wages/1
  # PUT /wages/1.json
  def update
    @project = Project.find(params[:project_id])
    @wage = @project.wages.find(params[:id])
    @wage.labourer = @project.labourers.find_by_id(params[:wage][:labourer_id])
    @wage.phase = @project.phases.find_by_id(params[:wage][:phase_id])

    respond_to do |format|
      if @wage.update_attributes(params[:wage].except(:labourer_id, :phase_id))
        format.html { redirect_to [@project, @wage], notice: 'Wage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wages/1
  # DELETE /wages/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @wage = @project.wages.find(params[:id])
    @wage.destroy

    respond_to do |format|
      format.html { redirect_to project_wages_path(@project) }
      format.json { head :no_content }
    end
  end
end
