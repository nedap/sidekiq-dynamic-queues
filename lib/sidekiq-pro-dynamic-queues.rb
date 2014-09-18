require 'sidekiq'
require 'sidekiq/dynamic_queues/attributes'

module Sidekiq
  module DynamicQueues
    autoload :Fetch, 'sidekiq/dynamic_queues/fetch'
    autoload :ReliableFetch, 'sidekiq/dynamic_queues/reliable_fetch'
  end
end
