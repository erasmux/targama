class GramFormsController < SingleFieldController
  def initialize
    super(GramForm, :name)
  end
end
