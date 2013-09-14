class DataValuesController < ApplicationController
  # GET /annual_inflations
  # GET /annual_inflations.json
  
  before_action :set_class_name

  HIDDEN_KEYS = ["id", "updated_at", "created_at"]

  def index
    @query = {}
    order = params[:order] || "id"
    dir = params[:dir] || "asc"
    params.each do |key, value|
      @query[key] = value if @class.column_names.include? key.to_s
    end

    @data_values = @class.where(@query).order("#{order} #{dir}").paginate(:page => params[:page], :per_page => 30)
    
    [:order, :dir, :page].each { |key| @query.merge!({key.to_s =>  params[key]}) if params[key] }
    

    respond_to do |format|
      format.html { render 'data_values/index'}
      format.json { render json: @data_values }
    end
  end

  # GET /annual_inflations/1
  # GET /annual_inflations/1.json
  def show
    @data_value = @class.find(params[:id])

    respond_to do |format|
      format.html { render 'data_values/show'}
      format.json { render json: @data_value }
    end
  end

  # GET /annual_inflations/new
  # GET /annual_inflations/new.json
  def new
    @data_value = @class.new

    respond_to do |format|
      format.html { render 'data_values/new'}
      format.json { render json: @data_value }
    end
  end

  # GET /annual_inflations/1/edit
  def edit
    @data_value = @class.find(params[:id])
    render 'data_values/edit'
  end

  # POST /annual_inflations
  # POST /annual_inflations.json
  def create
    @data_value = @class.new(class_params)

    respond_to do |format|
      if @data_value.save
        format.html { redirect_to @data_value, notice: 'Data value was successfully created.' }
        format.json { render json: @data_value, status: :created, location: @data_value }
      else
        format.html { render "data_values/new" }
        format.json { render json: @data_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /annual_inflations/1
  # PUT /annual_inflations/1.json
  def update
    @data_value = @class.find(params[:id])

    respond_to do |format|
      if @data_value.update_attributes(params[:data_value])
        format.html { redirect_to @data_value, notice: 'Data value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annual_inflations/1
  # DELETE /annual_inflations/1.json
  def destroy
    @data_value = @class.find(params[:id])
    @data_value.destroy

    respond_to do |format|
      format.html { redirect_to polymorphic_url(@class) }
      format.json { head :no_content }
    end
  end

  private

    def class_params
      raise NotImplementedError, "Specify the parameters allowed and required for this class."
    end

    def set_class_name
      @class = controller_name.classify.constantize
    end

  module ActionView::CompiledTemplates
    HIDDEN_KEYS = HIDDEN_KEYS
  end

end
