!SLIDE

# Plugging in to Rails 3

!SLIDE

## The Rails 2 Way

    ActionView::Base.send :include, Formtastic::SemanticFormHelper
    ActionView::Base.send :include, Formtastic::LayoutHelper

!SLIDE

## The Rails 3 Way

    ActiveSupport.on_load(:action_view) do
      include Formtastic::SemanticFormHelper
      include Formtastic::LayoutHelper
    end

Whatever callback you use, it gives you the context of `ActionWhatever::Base`.

!SLIDE bullets

## ActiveSupport Hooks

* `before_configuration`
* `before_initialize`
* `before_eager_load`
* `after_initialize`
* All the base classes: `active_record`, `action_controller`, `action_view`, `action_mailer`, `i18n`

You can execute whatever code you need to inside these.
