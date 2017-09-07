require 'echo_include_processor'
require 'asciidoctor/extensions'

Asciidoctor::Extensions.register do
  include_processor EchoIncludeProcessor
end