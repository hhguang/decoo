class ZsbcController < ApplicationController
	def index
		if params[:search] 
      		@toys=Toy.where('name like ?',"%"+params[:search]+"%").paginate(:page => params[:page], :per_page => 16).order('name+0')
	    else
	       @toys = Toy.paginate(:page => params[:page], :per_page => 16).order("name+0")
	    end

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @toys }
	    end
	end
end
