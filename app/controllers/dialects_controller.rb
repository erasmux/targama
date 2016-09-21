class DialectsController < ApplicationController
  def index
    prepare_index
  end

  def create
    new_dialect = Dialect.new(dialect_params)
    if new_dialect.save
      redirect_to action: 'index'
    else
      prepare_index(new_dialect)
      render 'index'
    end
  end

  def update
    dialect = Dialect.find(params[:id])
    if dialect.update(dialect_params)
      redirect_to action: 'index'
    else
      prepare_index(dialect)
      render 'index'
    end
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    @dialect = Dialect.find(params[:id])
    @dialect.destroy

    redirect_to dialects_path
  end

private
  def prepare_index(cu_dialect=nil)
    @dialects = Dialect.all
    @new_dialect = cu_dialect && !cu_dialect.id ? cu_dialect : Dialect.new
    @pending_errors = cu_dialect ? cu_dialect.errors.full_messages : []
  end

  def dialect_params
    params.require(:dialect).permit(:name)
  end
end
