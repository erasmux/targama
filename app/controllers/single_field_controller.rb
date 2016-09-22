class SingleFieldController < ApplicationController
  # helper methods which should be aliased (or defined) by derived class:
  helper_method :records_path
  helper_method :record_path

  def initialize(model_klass, field_name)
    @klass = model_klass
    @fname = field_name
    super()
  end

  def index
    prepare_index
  end

  def create
    new_record = @klass.new(prepare_params)
    if new_record.save
      redirect_to action: 'index'
    else
      prepare_index(new_record)
      render 'index'
    end
  end

  def update
    record = @klass.find(params[:id])
    if record.update(prepare_params)
      redirect_to action: 'index'
    else
      prepare_index(record)
      render 'index'
    end
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    @record = @klass.find(params[:id])
    @record.destroy

    redirect_to records_path
  end

private
  def prepare_index(cu_record=nil)
    @records = @klass.all
    @new_record = cu_record && !cu_record.id ? cu_record : @klass.new
    @pending_errors = cu_record ? cu_record.errors.full_messages : []
  end

  def prepare_params
    params.require(@klass.name.underscore).permit(@fname)
  end
end
