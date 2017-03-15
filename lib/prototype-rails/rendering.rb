require 'action_view/helpers/rendering_helper'

ActionView::Helpers::RenderingHelper.module_eval do
  def render_with_update(options = {}, locals = {}, &block)
    if options == :update
      update_page(&block)
    else
      render_without_update(options, locals, &block)
    end
  end

  alias_method :render_without_update, :render
  alias_method_chain :render, :render_with_update
end
