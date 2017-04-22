#
# Autogenerated by Thrift Compiler (0.10.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'jaeger/thrift/jaeger_types'

module Jaeger
  module Thrift
    module Collector
      class Client
        include ::Thrift::Client

        def submitBatches(batches)
          send_submitBatches(batches)
          return recv_submitBatches()
        end

        def send_submitBatches(batches)
          send_message('submitBatches', SubmitBatches_args, :batches => batches)
        end

        def recv_submitBatches()
          result = receive_message(SubmitBatches_result)
          return result.success unless result.success.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'submitBatches failed: unknown result')
        end

      end

      class Processor
        include ::Thrift::Processor

        def process_submitBatches(seqid, iprot, oprot)
          args = read_args(iprot, SubmitBatches_args)
          result = SubmitBatches_result.new()
          result.success = @handler.submitBatches(args.batches)
          write_result(result, oprot, 'submitBatches', seqid)
        end

      end

      # HELPER FUNCTIONS AND STRUCTURES

      class SubmitBatches_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        BATCHES = 1

        FIELDS = {
          BATCHES => {:type => ::Thrift::Types::LIST, :name => 'batches', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Jaeger::Thrift::Batch}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class SubmitBatches_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0

        FIELDS = {
          SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Jaeger::Thrift::BatchSubmitResponse}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

    end

  end
end
