module ActiveSupport
  module Inflector
    def pluralize(word, count = 2)
      result = word.to_s.dup

      if word.empty? || inflections.uncountables.include?(result.downcase)
        result
      else
        inflections.plurals.each do |(rule, replacement)|
          if replacement.is_a?(Hash)
            if result == rule
              if replacement.has_key?(:proc) && replacement[:proc].is_a?(Proc)
                proc = replacement[:proc]
              elsif replacement.has_key?(:proc) && inflections.procs[replacement[:proc].to_sym].is_a?(Proc)
                proc = inflections.procs[replacement[:proc].to_sym]
              elsif inflections.default_proc.is_a?(Proc)
                proc = inflections.default_proc
              end
              if proc
                result = proc.call(count, result, replacement)
                break
              end
            end
          else
            break if result.gsub!(rule, replacement)
          end
        end
        result
      end
      result
    end
    class Inflections
      attr_reader :procs

      def proc(locale, proc)
        @procs = {} if @procs.nil?
        @procs[locale.to_sym] = proc
      end

      def default_proc
        @procs[@procs.keys.first]
      end
    end
  end
end