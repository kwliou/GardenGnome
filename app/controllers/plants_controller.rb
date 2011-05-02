class PlantsController < ApplicationController
  # GET /plants
  # GET /plants.xml
  def index
    @plants = Plant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plants }
    end
  end

  # GET /plants/1
  # GET /plants/1.xml
  def show
    @plant = Plant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plant }
    end
  end

  # GET /plants/new
  # GET /plants/new.xml
  def new
    @plant = Plant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plant }
    end
  end

  # GET /plants/1/edit
  def edit
    @plant = Plant.find(params[:id])
  end

  # POST /gardens/1/plots/1/plants
  # POST /gardens/1/plots/1/plants.json
  def create
    @plot = Plot.find(params[:plot_id])
    @plant = @plot.plants.build(params[:plant])

    respond_to do |format|
      if @plant.save
        format.html { redirect_to(@plant, :notice => 'Plant was successfully created.') }
        format.json  { render :json => @plant.id }
        #format.xml  { render :xml => @plant, :status => :created, :location => @plant }
      else
        format.html { render :action => "new" }
        format.json  { render :json => 0 }
        #format.xml  { render :xml => @plant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plants/1
  # PUT /plants/1.xml
  def update
    @plant = Plant.find(params[:id])

    respond_to do |format|
      if @plant.update_attributes(params[:plant])
        format.html { redirect_to(@plant, :notice => 'Plant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.xml
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to(plants_url) }
      format.xml  { head :ok }
    end
  end
end
