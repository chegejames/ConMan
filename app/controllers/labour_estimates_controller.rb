class LabourEstimatesController < ApplicationController
  # GET /labour_estimates
  # GET /labour_estimates.json
  def index
    @labour_estimates = LabourEstimate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labour_estimates }
    end
  end

  # GET /labour_estimates/1
  # GET /labour_estimates/1.json
  def show
    @labour_estimate = LabourEstimate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @labour_estimate }
    end
  end

  # GET /labour_estimates/new
  # GET /labour_estimates/new.json
  def new
    @labour_estimate = LabourEstimate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @labour_estimate }
    end
  end

  # GET /labour_estimates/1/edit
  def edit
    @labour_estimate = LabourEstimate.find(params[:id])
  end

  # POST /labour_estimates
  # POST /labour_estimates.json
  def create
    @labour_estimate = LabourEstimate.new(params[:labour_estimate])

    respond_to do |format|
      if @labour_estimate.save
        format.html { redirect_to @labour_estimate, notice: 'Labour estimate was successfully created.' }
        format.json { render json: @labour_estimate, status: :created, location: @labour_estimate }
      else
        format.html { render action: "new" }
        format.json { render json: @labour_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /labour_estimates/1
  # PUT /labour_estimates/1.json
  def update
    @labour_estimate = LabourEstimate.find(params[:id])

    respond_to do |format|
      if @labour_estimate.update_attributes(params[:labour_estimate])
        format.html { redirect_to @labour_estimate, notice: 'Labour estimate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @labour_estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labour_estimates/1
  # DELETE /labour_estimates/1.json
  def destroy
    @labour_estimate = LabourEstimate.find(params[:id])
    @labour_estimate.destroy

    respond_to do |format|
      format.html { redirect_to labour_estimates_url }
      format.json { head :no_content }
    end
  end
end
