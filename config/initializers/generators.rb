# This section is copied from the Complete Guide to Rails Testing and is
# supposed to suppress the generation of some of the files from RSpec when
# generating a Scaffold.
Rails.application.config.generators do |g|
  g.test_framework :rspec,
                   fixtures: false,
                   view_specs: false,
                   helper_specs: false,
                   routing_specs: false,
                   request_specs: false,
                   controller_specs: false
end
