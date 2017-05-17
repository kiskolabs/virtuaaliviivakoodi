module Virtuaaliviivakoodi
  DUE_DATE_PATTERN = /^[0-9]{6}$/

  class DueDateNormalizer
    def self.call(due_date)
      if due_date
        if due_date.respond_to?(:strftime)
          due_date.strftime("%y%m%d")
        else
          raise ArgumentError, "Due date is not valid" if (!due_date.to_s.match(DUE_DATE_PATTERN))

          due_date
        end
      else
        Virtuaaliviivakoodi.pad("", 6)
      end
    end
  end
end
