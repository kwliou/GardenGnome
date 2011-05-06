class GardensController < ApplicationController
  require 'digest/sha2'
  layout "scaffold"
  
  protect_from_forgery :except => :create
  
  # GET /gardens
  # GET /gardens.xml
  def index
    @gardens = Garden.find_all_by_is_public(true)
    @private_gardens = Garden.find_all_by_is_public(false)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gardens }
      format.json  { render :json => @gardens.map {|g| g.id } }
    end
  end

  # GET /gardens/stubs
  def stubs
    @gardens = Garden.all
    @stubs = @gardens.map { |g| g.stub }

    render :json => @stubs
  end
 
  # GET /find
  # GET /find.json
  def find
    name = params[:name]
    city = params[:city]
    state = params[:state]
    query = ""
    vars = []
    if !name.nil?
      query += "lower(name) LIKE ?"
      vars.push("%#{name.downcase}%")
    end
    if !city.nil?
      query += " AND " if !query.empty? 
      query += "lower(city) LIKE ?"
      vars.push("%#{city.downcase}%")
    end
    if !state.nil?
      query += " AND " if !query.empty? 
      query += "lower(state) LIKE ?"
      vars.push("%#{state.downcase}%")
    end
    @gardens = Garden.all(:conditions => [query] + vars)
    @stubs = @gardens.map { |g| g.stub }

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @stubs }
    end
  end

  # GET /gardens/1
  def show
    @garden = Garden.find(params[:id])
    @plots = @garden.plots
	
	@photos = @garden.photos
    @hash = @photos.map {|p| Digest::SHA2.hexdigest("#{@garden.id}|#{p.id}|AKIAIPOGJD62WOASLQYA") }
    
    @aws = "http://s3.amazonaws.com/gardengnome/"
    
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @garden }
    end
  end

  # GET /search
  def search
    name = params[:name]
    city = params[:city]
    state = params[:state]
    @garden = Garden.first(:conditions => ["name = ? AND city = ? AND state = ?", name, city, state])
	
    respond_to do |format|
      format.json  { render :json => @garden.nil? ? 0 : @garden.id }
    end
  end

  # GET /gardens/1/stub
  def stub
    @garden = Garden.find(params[:garden_id])

    render :json => @garden.stub
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
  # POST /gardens.json
  def create
    @garden = Garden.new(params[:garden])

    respond_to do |format|
      if @garden.save
        format.html { redirect_to(@garden, :notice => 'Garden was successfully created.') }
        format.json { render :json => @garden.id }
        #format.xml  { render :xml => @garden, :status => :created, :location => @garden }
      else
        format.html { render :action => "new" }
        format.json { render :json => 0 }
        #format.xml  { render :xml => @garden.errors, :status => :unprocessable_entity }
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
