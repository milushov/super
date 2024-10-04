# frozen_string_literal: true

module ApplicationHelper
  # I like how simple it is
  # https://medium.com/@kosovacsedad/ruby-on-rails-decorator-design-pattern-b54a1afd03c8
  def decorate(model, decorate_class = nil)
    (decorate_class || "#{model.class}Decorator".constantize).new(model)
  end
end
