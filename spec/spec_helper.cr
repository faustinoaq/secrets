require "spec"
require "../src/secrets"

FakeIO = IO::Memory.new("abc\r")

module FakeSecrets
  extend Secrets

  private def self.gets_char
    gets_byte(FakeIO)
  end
end
