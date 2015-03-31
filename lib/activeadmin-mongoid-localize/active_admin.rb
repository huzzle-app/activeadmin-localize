module ActiveAdmin
  class FormBuilder
    def localized_input(name, args = {})
      # byebug
      # self.inputs
      inputs << super(name, args)
    end
  end
end
