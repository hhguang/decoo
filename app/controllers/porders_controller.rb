class PordersController < ApplicationController
  load_and_authorize_resource
  # GET /porders
  # GET /porders.json
  def index
    if ! params[:filter] or params[:filter]=="all"
      @filter_str="all"
      filter="1=1"
    elsif params[:filter]=="done"
      filter={:is_out=>true}
      @filter_str="done"
    else
      filter={:is_out=>false}
      @filter_str="none"
    end
    if params[:search] 
      @search=params[:search]
      @porders=Porder.joins(:toy).where(filter).where('porders.name like ? or toys.name like ? ',"%"+params[:search]+"%","%"+params[:search]+"%").paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
    else
       @porders = Porder.where(filter).paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
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
      format.csv {
        send_data("",
          :type => "text/excel;charset=utf-8; header=present",
          :filename => "#{@porder.name}.csv")
      }
    end
  end

  # GET /porders/new
  # GET /porders/new.json
  def new
    @toy=Toy.find(params[:toy_id]) if params[:toy_id]

    @quantity=params[:quantity] || 1
    @parts=@toy.parts
    if params[:package_id]
      @package=Package.find(params[:package_id]) 
      @toy=@package.toy || @package.parent.toy
      @parts=@package.all_parts
    end
    @porder = @toy.porders.build(:quantity=>@quantity)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @porder }
    end
  end

  # GET /porders/1/edit
  def edit
    @porder = Porder.find(params[:id])
    @toy=@porder.toy
    @quantity=@porder.quantity
    @parts=@porder.toy.parts
    @porder_items=@porder.porder_items
    @part_ids=@porder_items.map{|p|p.part.id}
  end

  # POST /porders
  # POST /porders.json
  def create
    @porder = Porder.new(params[:porder])
    @porder.user_id=current_user.id
    @porder.name="p"+Time.now.strftime("%Y%m%d%H%M%S ")
    
    @part_ids=params[:part_ids]
    @part_ids.each do |part_id|
      part=Part.find(part_id)
      pg=part.package.parent_id ?  part.package.parent.quantity*part.package.quantity : part.package.quantity
      @porder.porder_items.build(:part_id=>part_id,:quantity=>@porder.quantity*part.quantity*pg)
    end
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
        @porder.porder_items.clear
        @part_ids=params[:part_ids]
        @part_ids.each do |part_id|
          part=Part.find(part_id)
          pg=part.package.parent_id ?  part.package.parent.quantity*part.package.quantity : part.package.quantity
          @porder.porder_items.create(:part_id=>part_id,:quantity=>@porder.quantity*part.quantity*pg)
        end
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

  def out
    index
  end
end
