class TwordsController < ApplicationController
  helper_method :pending_errors, :pending_errors?

  def index
    @records = Tword.all
  end

  def new
    @record = Tword.new
  end

  def edit
    @record = Tword.find(params[:id])
  end

  def create
    @record = Tword.new(prepare_params)
    if @record.save
      redirect_to @record
    else
      render 'new'
    end
  end

  def update
    @record = Tword.find(params[:id])

    if @record.update(prepare_params)
      redirect_to @record
    else
      render 'edit'
    end
  end

  def show
    redirect_to action: 'index'
  end

  def destroy
    @record = Tword.find(params[:id])
    @record.destroy

    redirect_to twords_path
  end

  def pending_errors?
    @record.errors.any?
  end

  def pending_errors
    @pending_errors ||= prepare_pending_errors
  end

private
  def prepare_pending_errors
    # we remove these two message because our validation already produces
    # better translated messages for gram form and dialect ids:
    @record.errors.full_messages.reject do |msg|
      ['Gram form must exist', 'Dialect must exist'].include?(msg)
    end
  end

  def prepare_params
    params.require(:tword).permit(:word, :word_inflection, :gram_form_id, :dialect_id, :additional_info)
  end
end
