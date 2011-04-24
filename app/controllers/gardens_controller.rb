class GardensController < ApplicationController
  layout "scaffold"

  # GET /gardens
  # GET /gardens.xml
  def index
    @gardens = Garden.find_all_by_public(true)
    @private_gardens = Garden.find_all_by_public(false)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gardens }
      format.json  { render :json => @gardens.map {|g| g.id } }
    end
  end

  # GET /gardens/1
  # GET /gardens/1.xml
  def show
    @garden = Garden.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @garden }
      format.json  { render :json => @garden }
    end
  end

  # GET /gardens/new
  # GET /gardens/new.xml
  def new
    @garden = Garden.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @garden }
    end
  end

  # GET /gardens/1/edit
  def edit
    @garden = Garden.find(params[:id])
  end

  # POST /gardens
  # POST /gardens.xml
  def create
    if params.has_key?(:garden)
	    @garden = Garden.new(params[:garden])
    else
    	@garden = Garden.new(ActiveSupport::JSON.decode(params))
    end
    respond_to do |format|
      if @garden.save
        format.html { redirect_to(@garden, :notice => 'Garden was successfully created.') }
        format.xml  { render :xml => @garden, :status => :created, :location => @garden }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @garden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gardens/1
  # PUT /gardens/1.xml
  def update
    @garden = Garden.find(params[:id])

    respond_to do |format|
      if @garden.update_attributes(params[:garden])
        format.html { redirect_to(@garden, :notice => 'Garden was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @garden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gardens/1
  # DELETE /gardens/1.xml
  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy

    respond_to do |format|
      format.html { redirect_to(gardens_url) }
      format.xml  { head :ok }
    end
  end
end
