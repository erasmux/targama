class DialectsController < SingleFieldController
  def initialize
    super(Dialect, :name)
  end
end
