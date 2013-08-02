class AlonePordersController < ApplicationController
  def index
  end

  def new
  	@porder=Porder.new
    5.times{@porder.porder_items.build}
  end

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

  def edit
  	@porder = Porder.find(params[:id])
  end

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

end
