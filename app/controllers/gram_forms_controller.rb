class GramFormsController < SingleFieldController
  def initialize
    super(GramForm, :name)
  end

  alias_method :records_path, :gram_forms_path
  alias_method :record_path, :gram_form_path
end
