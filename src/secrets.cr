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

  def gets(prompt = "", hint = "*", empty_error : String? = nil, retry : Int32? = nil)
    print prompt
    input = [] of String
    i = 0
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
        if input.size == 0
          puts
          if retry || empty_error
            if retry
              break if i >= retry
            end
            if empty_error
              puts empty_error unless empty_error.empty?
            end
          end
          sleep 1
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
      i += 1
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
