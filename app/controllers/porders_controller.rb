class PordersController < ApplicationController
  # GET /porders
  # GET /porders.json
  def index
    if params[:search] 
      @porders=Porder.where('name like ?',"%"+params[:search]+"%").paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
    else
       @porders = Porder.paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @porders }
    end
  end

  # GET /porders/1
  # GET /porders/1.json
  def show
    @porder = Porder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @porder }
    end
  end

  # GET /porders/new
  # GET /porders/new.json
  def new
    @toy=Toy.find(params[:toy_id]) if params[:toy_id]
    
    @quantity=params[:quantity] || 1
    @parts=@toy.parts
    @porder = @toy.porders.build(:quantity=>@quantity)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @porder }
    end
  end

  # GET /porders/1/edit
  def edit
    @porder = Porder.find(params[:id])
  end

  # POST /porders
  # POST /porders.json
  def create
    @porder = Porder.new(params[:porder])
    @porder.user_id=current_user.id
    @porder.name="p"+Time.now.strftime("%Y%m%d%H%M%S ")
    respond_to do |format|
      if @porder.save
        format.html { redirect_to @porder, notice: 'Porder was successfully created.' }
        format.json { render json: @porder, status: :created, location: @porder }
      else
        format.html { render action: "new" }
        format.json { render json: @porder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /porders/1
  # PUT /porders/1.json
  def update
    @porder = Porder.find(params[:id])

    respond_to do |format|
      if @porder.update_attributes(params[:porder])
        format.html { redirect_to @porder, notice: 'Porder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @porder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /porders/1
  # DELETE /porders/1.json
  def destroy
    @porder = Porder.find(params[:id])
    @porder.destroy

    respond_to do |format|
      format.html { redirect_to porders_url }
      format.json { head :no_content }
    end
  end
end
