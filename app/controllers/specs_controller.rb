# encoding: utf-8
class SpecsController < ApplicationController
  # GET /specs
  # GET /specs.json
  def index
    @product=Product.find(params[:product_id])
    @specs = @product.specs.order("id desc")
    @spec=Spec.new(:product_id=>@product.id,:bh=>"#{@product.bh}-")
    respond_to do |format|
      format.html { render :layout=>false }
      format.json { render json: @specs }
      format.js
    end
  end

  # GET /specs/1
  # GET /specs/1.json
  def show
    @spec = Spec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spec }
    end
  end

  # GET /specs/new
  # GET /specs/new.json
  def new
    @product=Product.find(params[:product_id])
    @spec = Spec.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spec }
      format.js
    end
  end

  # GET /specs/1/edit
  def edit
    @spec = Spec.find(params[:id])
    @materials=SpecProperty.material
    @product=Product.find(params[:product_id])
    
    respond_to do |format|
      format.html {render :layout=>false}
      format.json { render json: @spec }
      format.js  
    end
    
  end

  # POST /specs
  # POST /specs.json
  def create
    @product=Product.find(params[:product_id])    
    params[:spec][:material]=params[:spec][:material].join(",") if params[:spec][:material]
    @spec=@product.specs.build(params[:spec])
    respond_to do |format|

      if @spec.save
        @specs=@spec.product.specs.order('id desc')
        format.html { redirect_to edit_product_url(@product), notice: '新规格已成功创建.' }
        format.json { render json: @spec, status: :created, location: @spec }
        format.js   { render action: "index" }
      else
        format.html { render action: "new" }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
        format.js   { render action: "new"}
      end
    end
  end

  # PUT /specs/1
  # PUT /specs/1.json
  def update
    
    @product=Product.find(params[:product_id])
    @spec = @product.specs.find(params[:id])   
    params[:spec][:material]=params[:spec][:material].join(",") if params[:spec][:material]  
    respond_to do |format|
      if @spec.update_attributes(params[:spec])
        format.html { redirect_to edit_product_url(@product), notice: '新规格已成功修改.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
        format.js   { render action: "edit" }
      end
    end
  end

  # DELETE /specs/1
  # DELETE /specs/1.json
  def destroy
    @spec = Spec.find(params[:id])
    
    @product=@spec.product
    begin
      @spec.destroy
      @deleted=true
    rescue Exception=>e
      flash.now[:error]=e.message
      @deleted=false
    end
    respond_to do |format|
      format.html { redirect_to edit_product_url(@product), notice: '规格已成功删除.' }
      format.json { head :no_content }
      format.js   {@deleted}
    end

  end
end
