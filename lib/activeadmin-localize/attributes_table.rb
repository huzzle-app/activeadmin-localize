module ActiveAdmin
  module Views
    class LocalizedAttributesTable < ActiveAdmin::Views::AttributesTable
      builder_method :localize_attributes_table_for

      def row(*args, &block)
        _locales = ActiveAdmin::Localize.locales

        title   = args[0]
        options = args.extract_options!
        classes = [:row]
        if options[:class]
          classes << options[:class]
        elsif title.present?
          classes << "row-#{title.to_s.parameterize(separator: "_")}"
        end
        options[:class] = classes.join(' ')

        _locales.each_with_index do |locale, index|
          @table << tr(options) do
            if index == 0
              th :rowspan => _locales.length do
                header_content_for(title)
              end
            end
            @collection.each do |record|
              data = nil
              I18n.with_locale locale do
                val = record.send(title)
                data = content_tag :div do
                  (
                    image_tag("activeadmin-localize/#{locale.to_s}.svg", alt: locale.to_s, title: locale.to_s, width: 20, height: 15) +
                    ' ' +
                    (val.blank? ? "-" : CGI.escapeHTML(val)).html_safe
                  )
                end
              end
              td data
            end
          end
        end
      end

      protected

      def default_id_for_prefix
        'attributes_table'
      end

      def default_class_name
        'attributes_table'
      end
    end
  end
end
