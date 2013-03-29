# encoding: utf-8
class OutstocksController < ApplicationController
  # GET /outstocks
  # GET /outstocks.json
  def index
    @outstocks = Outstock.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outstocks }
    end
  end

  # GET /outstocks/1
  # GET /outstocks/1.json
  def show
    @outstock = Outstock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outstock }
    end
  end

  # GET /outstocks/new
  # GET /outstocks/new.json
  def new
    @outstock = Outstock.new
    3.times {@outstock.outstock_items.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outstock }
    end
  end

  # GET /outstocks/1/edit
  def edit
    @outstock = Outstock.find(params[:id])
  end

  # POST /outstocks
  # POST /outstocks.json
  def create
    @outstock = Outstock.new(params[:outstock])

    respond_to do |format|
      if @outstock.save
        format.html { redirect_to @outstock, notice: 'Outstock was successfully created.' }
        format.json { render json: @outstock, status: :created, location: @outstock }
      else
        format.html { render action: "new" }
        format.json { render json: @outstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outstocks/1
  # PUT /outstocks/1.json
  def update
    @outstock = Outstock.find(params[:id])

    respond_to do |format|
      if @outstock.update_attributes(params[:outstock])
        format.html { redirect_to @outstock, notice: 'Outstock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outstocks/1
  # DELETE /outstocks/1.json
  def destroy
    @outstock = Outstock.find(params[:id])
    @outstock.destroy

    respond_to do |format|
      format.html { redirect_to outstocks_url }
      format.json { head :no_content }
    end
  end

  def find_stock
    if params[:weight].strip!.empty? || params[:bh].strip!.empty?
      flash.now[:error]="没有输入编号或重量"
    else
      @spec=Spec.find_by_bh(params[:bh]) if params[:bh]
      if @spec && @stock=Stock.find_by_spec_id(@spec.id)
        @outstock_item = OutstockItem.new(:spec_id=>@spec.id,:weight=>params[:weight])
      else

        flash.now[:error]="库存里没有编号为#{params[:bh]}的零件"
      end
      
    end
    
    respond_to do |format|
      format.html { redirect_to outstocks_url }
      format.js   
    end
  end
  
end
