class ScanningsController < ApplicationController
  # GET /scannings
  # GET /scannings.json
  def index
    @scannings = Scanning.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scannings }
    end
  end


  def index1
    
    @scannings = Scanning.find_by_sql("select scanUrl,scanDate ,scanTitle from scannings")  

    @j = { :a =>'succss',  :b =>  @scannings}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @j }
    end
  end
  # GET /scannings/1
  # GET /scannings/1.json
  def show
    @scanning = Scanning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scanning }
    end
  end

  # GET /scannings/new
  # GET /scannings/new.json
  def new
    @scanning = Scanning.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scanning }
    end
  end

  # GET /scannings/1/edit
  def edit
    @scanning = Scanning.find(params[:id])
  end

  # POST /scannings
  # POST /scannings.json
  def create
    @scanning = Scanning.new(params[:scanning])

    respond_to do |format|
      if @scanning.save
        format.html { redirect_to @scanning, notice: 'Scanning was successfully created.' }
        format.json { render json: @scanning, status: :created, location: @scanning }
      else
        format.html { render action: "new" }
        format.json { render json: @scanning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scannings/1
  # PUT /scannings/1.json
  def update
    @scanning = Scanning.find(params[:id])

    respond_to do |format|
      if @scanning.update_attributes(params[:scanning])
        format.html { redirect_to @scanning, notice: 'Scanning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scanning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scannings/1
  # DELETE /scannings/1.json
  def destroy
    @scanning = Scanning.find(params[:id])
    @scanning.destroy

    respond_to do |format|
      format.html { redirect_to scannings_url }
      format.json { head :no_content }
    end
  end
end
