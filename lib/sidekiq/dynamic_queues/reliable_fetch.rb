require 'celluloid'
require 'sidekiq/util'
require 'sidekiq/fetch'

module Sidekiq
  module DynamicQueues

    # enable with:
    #    Sidekiq.configure_server do |config|
    #        config.options[:fetch] = Sidekiq::DynamicQueues::ReliableFetch
    #    end
    #
    class ReliableFetch < Sidekiq::Pro::ReliableFetch

      include Sidekiq::Util
      include Sidekiq::DynamicQueues::Attributes

      def initialize options
        @original_options = options.dup
        super options_with_dynamic_queues(options)
      end

      def active_queues
        if self.paused
          (options[:queues] - paused).map {|q| ["queue:#{q}", self.class.private_queue(q, options)] }
        else
          self.class.get_queues(options)
        end
      end

      def options
        options_with_dynamic_queues(@original_options)
      end

      def options_with_dynamic_queues(options)
        dynamic_queues = translate_from_cli(*options[:queues])
        if dynamic_queues.grep(/(^!)|(^@)|(\*)/).size == 0
          options
        else
          options.merge( queues: expand_queues(dynamic_queues, false) )
        end
      end

      def translate_from_cli(*queues)
        queues.collect do |queue|
          queue.gsub('.star.', '*').gsub('.at.', '@').gsub('.not.', '!')
        end
      end

    end

  end
end
