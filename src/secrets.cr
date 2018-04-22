require "./secrets/*"

# `Secrets` gets secrets using a hint character
# with support for backspace.
#
# ```
# Secrets.gets prompt: "Write your secrets: ", hint: "✕", empty_error: "Try again!"
# Secrets.gets prompt: "password: "
# ```
module Secrets
  extend self

  def gets(prompt = "", hint = "*", empty_error : String? = nil)
    print prompt
    input = [] of String
    loop do
      char = gets_char
      case char[0].ord
      when 127
        if input.size > 0
          input.pop
          print "\u{8}"
          print " "
          print "\u{8}"
        end
      when 13
        if input.size == 0 && (error = empty_error)
          sleep 1
          puts
          puts error unless error.empty?
          print prompt
        else
          break
        end
      when 3
        exit 1
      else
        input << char
        print hint
      end
    end
    puts
    input.join
  end

  private def gets_char
    STDIN.raw do |io|
      gets_byte(io)
    end
  end

  private def gets_byte(io)
    buffer = Bytes.new(1)
    bytes_read = io.read(buffer)
    if bytes_read == 0
      "\r"
    else
      String.new(buffer[0, bytes_read])
    end
  end
end
