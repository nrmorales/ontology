class CharacteristicsController < ApplicationController
  # GET /characteristics
  # GET /characteristics.json
  def index
    @characteristics = Characteristic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characteristics }
    end
  end

  # GET /characteristics/1
  # GET /characteristics/1.json
  def show
    @characteristic = Characteristic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @characteristic }
    end
  end

  # GET /characteristics/new
  # GET /characteristics/new.json
  def new
    @characteristic = Characteristic.new
    @descriptor = Descriptor.all
    @value = []
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @characteristic }
    end
  end

  # GET /characteristics/1/edit
  def edit
    @characteristic = Characteristic.find(params[:id])
    if @characteristic.descriptor.values.present?
      @value = @characteristic.descriptor.values
    end
  end

  # POST /characteristics
  # POST /characteristics.json
  def create
    @characteristic = Characteristic.new(params[:characteristic])

    respond_to do |format|
      if @characteristic.save
        @characteristic.update_attributes(:value => params[:value]) if @characteristic.descriptor.values.empty?
        format.html { redirect_to @characteristic, notice: 'Characteristic was successfully created.' }
        format.json { render json: @characteristic, status: :created, location: @characteristic }
      else
        format.html { render action: "new" }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characteristics/1
  # PUT /characteristics/1.json
  def update
    @characteristic = Characteristic.find(params[:id])
    respond_to do |format|
      if @characteristic.update_attributes(params[:characteristic])
        @characteristic.update_attributes(:value => params[:value]) if @characteristic.descriptor.values.empty?
        format.html { redirect_to @characteristic, notice: 'Characteristic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristics/1
  # DELETE /characteristics/1.json
  def destroy
    @characteristic = Characteristic.find(params[:id])
    @characteristic.destroy

    respond_to do |format|
      format.html { redirect_to characteristics_url }
      format.json { head :no_content }
    end
  end
end

