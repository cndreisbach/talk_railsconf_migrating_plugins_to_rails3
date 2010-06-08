First thing that broke was the Exception backtrace cleanup. Exception doesn't have a `clean_backtrace` method in Rails 3, so I grepped through the code to find how it was done. I found ActiveSupport::BacktraceCleaner. Our old way cleaned all the lines at once, but BacktraceCleaner took filters to clean a line at a time. I changed our code to match.

Next, I was getting an error about ActiveRecord::Base not having an `establish_connection` method. It obviously still does, so I took a look and found that it was including a bunch of stuff before ActiveRecord::Base got loaded. I wrapped the code in a `ActiveSupport.on_load(:active_record)` block.

Next, nothing was actually happening. I tracked this down to `Footnotes::Filter`. Its method `valid?` was failing. This was super-frustrating and I made `valid?` equal to true for now.

Next, `LayoutNote` was barfing because it called `active_layout` on a controller instance. It was only calling this to check for a layout. I grepped through `actionpack` and found that layout stuff got moved into `AbstractController`. There's a method there called `action_has_layout?` that works well. Elsewhere in the file, it needs the active layout, which is now found from a private method called `_layout`.

Next: Footnotes Footnotes::Notes::FiltersNoteNote Exception: undefined method `filter_chain` for TeamsController:Class. 

LogNote had an issue because it called `controller_class_name` on TeamsController. Looking in Rails 2.3, this is just the controller's name with the module prefix removed. Looking at the code, I'm not sure why it was removed.
