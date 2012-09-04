
class Foo

  def init()
    super
    puts "Bar"
    self
  end

  def bar(bar, baz:baz)
    block = lambda do |n|
      puts n
    end
    block.call 5
  end

end

            def with_block(block)
              block.call 5
            end

            j = with_block lambda { |n|
              n * n
            }