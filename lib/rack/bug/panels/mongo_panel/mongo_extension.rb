require 'mongo'

if defined?(Mongo)
  Mongo::Collection.class_eval do

    def find_with_rack_bug(selector = {}, opts = {})
      Rack::Bug::MongoPanel.record(selector, opts) do
        find_without_rack_bug(selector, opts)
      end
    end
  
    alias_method_chain :find, :rack_bug
  end
end
