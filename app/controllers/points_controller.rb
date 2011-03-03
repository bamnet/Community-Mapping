class PointsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :layer, :through => :project
  load_and_authorize_resource :point, :through => :layer

  # GET /points/1
  # GET /points/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/new
  # GET /points/new.xml
  def new
    @point.latitude = @project.center_latitude
    @point.longitude = @project.center_longitude

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points
  # POST /points.xml
  def create
    @point.layer = nil if @point.layer.project != @project

    respond_to do |format|
      if @point.save
        format.html { redirect_to([@project, @layer, @point], :notice => 'Point was successfully created.') }
        format.xml  { render :xml => @point, :status => :created, :location => @point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.xml
  def update
    respond_to do |format|
      if @point.update_attributes(params[:point])
        @point.reload #HACK HACK HACK: I don't know why I need to do this, but the layer doesn't update unless I do
        format.html { redirect_to([@project, @point.layer, @point], :notice => 'Point was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.xml
  def destroy
    @point.destroy

    respond_to do |format|
      format.html { redirect_to([@project, @layer]) }
      format.xml  { head :ok }
    end
  end
end
