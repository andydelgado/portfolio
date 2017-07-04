module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Andy Delgado | Portfolio"
    @seo_keywords = "Andy Delgado portfolio"
  end
end