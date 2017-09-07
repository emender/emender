require 'asciidoctor'
require 'asciidoctor/extensions'
require 'open-uri'

# An include processor which will be notified of all include macros.
# See more information at http://asciidoctor.org/docs/user-manual/#include-processor-example
class EchoIncludeProcessor < Asciidoctor::Extensions::IncludeProcessor
  def handles? target
    true
  end

  def process doc, reader, target, attributes
    puts "Found an include: #{target}"
  end
end

# Tells asciidoctor to load/register the extensions in the block.
Asciidoctor::Extensions.register do
  include_processor EchoIncludeProcessor
end