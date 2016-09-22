class DialectsController < SingleFieldController
  def initialize
    super(Dialect, :name)
  end

  alias_method :records_path, :dialects_path
  alias_method :record_path, :dialect_path
end
