class DataValuesController < ApplicationController
  HIDDEN_KEYS = ["id", "updated_at", "created_at"]

  before_action :set_class_name

  # GET /annual_inflations
  # GET /annual_inflations.json
  def index
    @data_values,  @query = query_from_params

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
    def query_from_params
      query = {}
      joins = []
      order = class_params[:order] || "id"
      dir = class_params[:dir] || "asc"
      
      class_params.each do |key, value|
        if @class.column_names.include? key.to_s
          query[key] = value
        elsif @class.column_names.include? "#{key}_id"
          query["#{key_id}"] = value.to_i
        # elsif (this_reflection = @class.reflections[key.to_sym])
        #   if this_reflection.has_and_belongs_to_many?
        #     joins << this_reflection.join_table.to_sym
        #     search_column ="#{this_reflection.join_table}.#{this_reflection.association_foreign_key}"
        #     query[search_column] = value
        #     logger.info "~~~~~ HABTM ~~~~~~~~~ #{joins} #{search_column} #{value}"
        #   end
        end
      end

      data_values = @class
        .where(query)
        .order("#{query['order']} #{query['dir']}")
        .paginate(:page => class_params[:page], :per_page => 30)
      
      [:order, :dir, :page].each { |key| query.merge!({key.to_s =>  class_params[key]}) if class_params[key] }

      return [data_values, query]
    end

    def class_params
      whitelist = []
      whitelist += @class.column_names
      whitelist += @class.reflections.keys 
      whitelist += [:order, :dir, :page]
      whitelist -= HIDDEN_KEYS

      class_sym = @class.name.downcase.underscore.to_sym
      whitelist += [class_sym]
      params.permit(whitelist)
    end

    def set_class_name
      @class = controller_name.classify.constantize
    end

  module ActionView::CompiledTemplates
    HIDDEN_KEYS = HIDDEN_KEYS
  end

end
