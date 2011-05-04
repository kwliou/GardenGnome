class JournalsController < ApplicationController
  # GET /journals
  # GET /journals.json
  def index
    @plant = Plant.find(params[:plant_id])
    @journals = @plant.journals

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @journals }
      #format.xml  { render :xml => @journals }
    end
  end

  # GET /journals/1
  # GET /journals/1.xml
  def show
    @journal = Journal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @journal }
    end
  end

  # GET /journals/new
  # GET /journals/new.xml
  def new
    @journal = Journal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @journal }
    end
  end

  # GET /journals/1/edit
  def edit
    @journal = Journal.find(params[:id])
  end

  # POST /journals
  # POST /journals.xml
  def create
    @plant = Plant.find(params[:plant_id])
    @journal = @plant.journals.build(params[:journal])

    respond_to do |format|
      if @journal.save
        format.html { redirect_to(@journal, :notice => 'Journal was successfully created.') }
        format.json { render :json => @journal.id }
        #format.xml  { render :xml => @journal, :status => :created, :location => @journal }
      else
        format.html { render :action => "new" }
        format.json { render :json => 0 }
        #format.xml  { render :xml => @journal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /journals/1
  # PUT /journals/1.xml
  def update
    @journal = Journal.find(params[:id])

    respond_to do |format|
      if @journal.update_attributes(params[:journal])
        format.html { redirect_to(@journal, :notice => 'Journal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @journal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.xml
  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to(journals_url) }
      format.xml  { head :ok }
    end
  end
end
