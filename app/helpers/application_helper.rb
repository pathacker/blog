# frozen_string_literal: true

module ApplicationHelper
  def show_error_messages(model, model_name)
    return '' unless model.errors.any?

    str = '<div id="error_explanation">'
    str += "<h2>#{pluralize(model.errors.count, 'error')} prohibited this #{model_name} from being saved:</h2>"
    str += '<ul>'
    model.errors.each { |err| str += "<li>#{err.full_message}</li>" }
    str += '</ul>'
    str += '</div>'
    str
  end
end
