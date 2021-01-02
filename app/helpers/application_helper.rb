# frozen_string_literal: true

module ApplicationHelper
  def show_error_messages(model)
    return '' unless model.errors.any?

    title = "#{pluralize(model.errors.count, 'error')} prohibited this #{model.class.name} from being saved:"
    messages = model.errors.full_messages.map { |msg| "<li>#{msg}</li>" }.join

    "<div id='error_explanation'><h2>#{title}</h2><ul>#{messages}</ul></div>"
  end
end
