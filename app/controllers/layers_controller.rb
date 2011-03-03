class LayersController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :layer, :through => :project

  # GET /layers/1
  # GET /layers/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @layer }
    end
  end

  # GET /layers/new
  # GET /layers/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @layer }
    end
  end

  # GET /layers/1/edit
  def edit
  end

  # POST /layers
  # POST /layers.xml
  def create
    respond_to do |format|
      if @layer.save
        format.html { redirect_to([@project, @layer], :notice => 'Layer was successfully created.') }
        format.xml  { render :xml => @layer, :status => :created, :location => @layer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @layer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /layers/1
  # PUT /layers/1.xml
  def update
    respond_to do |format|
      if @layer.update_attributes(params[:layer])
        format.html { redirect_to([@project, @layer], :notice => 'Layer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @layer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /layers/1
  # DELETE /layers/1.xml
  def destroy
    @layer.destroy

    respond_to do |format|
      format.html { redirect_to(project_layers_url) }
      format.xml  { head :ok }
    end
  end
end
