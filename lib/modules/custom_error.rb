module CustomError
  class Error < StandardError; end
  class InsufficientAccess < Error; end
end