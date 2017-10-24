# Activeadmin::Localize

Easily edit localized fields in ActiveAdmin (all locales on one page)

Tested with [json_translate](https://github.com/cfabianski/json_translate) but other translation storages should also be compatible.

## Screenshot

 ![AML](https://rscx.ru/aml.jpg)

## Installation

Add this line to your application's Gemfile:

    gem 'activeadmin-localize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeadmin-localize

## Usage

Really simple:

    permit_params(
      title_translations: I18n.available_locales,
      content_translations: I18n.available_locales
    )

    # in model
    field :title, type: String, localize: true
    field :content, type: String, localize: true

    # in admin
    f.inputs do
      f.localized_input :title
      # and ckeditor too!
      f.localized_input :content, as: :ckeditor
    end

    # displaying in index action
    index do
      localize_column :title
    end

    # displaying in show action
    show do |f|
      panel I18n.t('fields') do
        localize_attributes_table_for f do
          row :name
          row :text
        end
      end
    end


## Configuration

By default this gem provides editable fields for all the available locales. If however, you would want to restrict to some particular locales, then create a new *'activeadmin_localize.rb'* file in the *'/config/initializers'* folder of your rails application:

    ActiveAdmin::Localize.configure do |config|
      config.locales = [:en, :ja]    # Specify the locales you want to use
    end

CKEditor is tested & working with my fork: https://github.com/glebtv/ckeditor

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This gem uses flags icons from [flag-icons-css](https://github.com/lipis/flag-icon-css) (MIT Licensed)

MIT License

