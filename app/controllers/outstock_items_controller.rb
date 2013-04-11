class OutstockItemsController < ApplicationController
  # GET /outstock_items
  # GET /outstock_items.json
  def index
    @outstock_items = OutstockItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outstock_items }
    end
  end

  # GET /outstock_items/1
  # GET /outstock_items/1.json
  def show
    @outstock_item = OutstockItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outstock_item }
    end
  end

  # GET /outstock_items/new
  # GET /outstock_items/new.json
  def new    
    @outstock_item = OutstockItem.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outstock_item }
      format.js
    end
  end

  # GET /outstock_items/1/edit
  def edit
    @outstock_item = OutstockItem.find(params[:id])
  end

  # POST /outstock_items
  # POST /outstock_items.json
  def create
    @outstock_item = OutstockItem.new(params[:outstock_item])

    respond_to do |format|
      if @outstock_item.valid?() #&& @outstock_item.set_item
        format.html { redirect_to @outstock_item, notice: 'Outstock item was successfully created.' }
        format.json { render json: @outstock_item, status: :created, location: @outstock_item }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @outstock_item.errors, status: :unprocessable_entity }
        format.js   { render ation: "new"}
      end
    end
  end

  # PUT /outstock_items/1
  # PUT /outstock_items/1.json
  def update
    @outstock_item = OutstockItem.find(params[:id])

    respond_to do |format|
      if @outstock_item.update_attributes(params[:outstock_item])
        format.html { redirect_to @outstock_item, notice: 'Outstock item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outstock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outstock_items/1
  # DELETE /outstock_items/1.json
  def destroy
    @outstock_item = OutstockItem.find(params[:id])
    @outstock_item.destroy

    respond_to do |format|
      format.html { redirect_to outstock_items_url }
      format.json { head :no_content }
    end
  end
end
