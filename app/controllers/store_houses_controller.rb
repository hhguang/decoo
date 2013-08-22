class StoreHousesController < ApplicationController
  # GET /store_houses
  # GET /store_houses.json
  def index
    @store_houses = StoreHouse.all
    @store_house = StoreHouse.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @store_houses }
    end
  end

  # GET /store_houses/1
  # GET /store_houses/1.json
  def show
    @store_house = StoreHouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store_house }
    end
  end

  # GET /store_houses/new
  # GET /store_houses/new.json
  def new
    @store_house = StoreHouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @store_house }
    end
  end

  # GET /store_houses/1/edit
  def edit
    @store_house = StoreHouse.find(params[:id])
  end

  # POST /store_houses
  # POST /store_houses.json
  def create
    @store_house = StoreHouse.new(params[:store_house])

    respond_to do |format|
      if @store_house.save
        format.html { redirect_to store_houses_url, notice: 'Store house was successfully created.' }
        format.json { render json: @store_house, status: :created, location: @store_house }
      else
        format.html { render action: "new" }
        format.json { render json: @store_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /store_houses/1
  # PUT /store_houses/1.json
  def update
    @store_house = StoreHouse.find(params[:id])

    respond_to do |format|
      if @store_house.update_attributes(params[:store_house])
        format.html { redirect_to store_houses_url, notice: 'Store house was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @store_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_houses/1
  # DELETE /store_houses/1.json
  def destroy
    @store_house = StoreHouse.find(params[:id])
    begin
      @store_house.destroy
    rescue Exception=>e
      flash[:notice]=e.message
    end

    respond_to do |format|
      format.html { redirect_to store_houses_url }
      format.json { head :no_content }
    end
  end
end
