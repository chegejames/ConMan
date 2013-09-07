class WagesController < ApplicationController
  # GET /wages
  # GET /wages.json
  def index
    @wages = Wage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wages }
    end
  end

  # GET /wages/1
  # GET /wages/1.json
  def show
    @wage = Wage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wage }
    end
  end

  # GET /wages/new
  # GET /wages/new.json
  def new
    @wage = Wage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wage }
    end
  end

  # GET /wages/1/edit
  def edit
    @wage = Wage.find(params[:id])
  end

  # POST /wages
  # POST /wages.json
  def create
    @wage = Wage.new(params[:wage])

    respond_to do |format|
      if @wage.save
        format.html { redirect_to @wage, notice: 'Wage was successfully created.' }
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
    @wage = Wage.find(params[:id])

    respond_to do |format|
      if @wage.update_attributes(params[:wage])
        format.html { redirect_to @wage, notice: 'Wage was successfully updated.' }
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
    @wage = Wage.find(params[:id])
    @wage.destroy

    respond_to do |format|
      format.html { redirect_to wages_url }
      format.json { head :no_content }
    end
  end
end
