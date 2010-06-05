!SLIDE

# Rake Tasks

!SLIDE

`tasks/` has been deprecated. Rake tasks go in `lib/tasks/` now.

Rake tasks can also now be moved into a Railtie:

    module Typus
      class Railtie < ::Rails::Railtie
        rake_tasks do
          namespace :typus do
            desc "Install acts_as_list, acts_as_tree and paperclip."
            task :misc do
              # ...
            end
          end
        end
      end
    end

!SLIDE

# Generators

!SLIDE bullets

## Big difference

* Rails 2: Rubigen
* Rails 3: Thor

!SLIDE

## Rails::Generators::Base

Pulls in a lot of the Rubigen API.

!SLIDE

## Rails 2 generator

    class FormtasticGenerator < Rails::Generator::Base
      def manifest
        record do |m|
          m.directory File.join('config', 'initializers')
          m.template 'formtastic.rb',   File.join('config', 'initializers', 'formtastic.rb')
          m.directory File.join('public', 'stylesheets')
          m.template 'formtastic.css',   File.join('public', 'stylesheets', 'formtastic.css')
          m.template 'formtastic_changes.css',   File.join('public', 'stylesheets', 'formtastic_changes.css')
        end
      end
    end

!SLIDE

## Rails 3 generator

    require 'rails/generators'

    class FormtasticGenerator < Rails::Generators::Base
      def install_formtastic
        template File.join('config', 'initializers', 'formtastic.rb')
        template File.join('public', 'stylesheets', 'formtastic.css')
        template File.join('public', 'stylesheets', 'formtastic_changes.css')
      end
    end

!SLIDE

## Rails 2 generator with name and options

    class FormGenerator < Rails::Generator::NamedBase
      default_options :haml => false,
                      :partial => false

      def initialize(runtime_args, runtime_options = {})
        base_name, @controller_class_path = extract_modules(@name.pluralize)
        # ...
      end

      def manifest
        record do |m|
          if options[:partial]
            # ...
          end
        end
      end
    end

!SLIDE

## Rails 3 generator with name and options

    class FormGenerator < Rails::Generators::NamedBase
      class_option :haml, :type => :boolean, 
        :desc => 'Generate HAML instead of ERB.'
      class_option :partial, :type => :boolean, 
        :desc => 'Generate a form partial in the model views path, i.e. "_form.html.erb" or _form.html.haml".'
      class_option :controller, :type => :string, :banner => 'PATH', 
        :desc => 'Generate for custom controller/view path - in case model and controller namespace is different, i.e. "admin/posts".'

      def create_form 
        base_name, controller_class_path = extract_modules(name.pluralize)

        if options[:partial]
          # ... 
        end
      end
    end

!SLIDE

Like tasks, generators have moved from `generators/` to `lib/generators/`.

!SLIDE

## RAILS_*

All the `RAILS_*` constants are now deprecated. 

Move to using the `Rails` object:
  * `Rails.env`
  * `Rails.root`
