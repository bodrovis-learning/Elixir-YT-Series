defmodule Dynamic do
  defmacro __using__(options) do
    to_import = options[:import] || []

    quote bind_quoted: [to_import: to_import] do
      def general do
      end

      if :demo1 in to_import do
        def demo1(a) do
          IO.puts(a)
        end
      end

      if :sys1 in to_import do
        def sys1(a) do
          IO.puts(a)
        end
      end

      if :sys2 in to_import do
        def sys2(a, b) do
          IO.puts(a + b)
        end
      end
    end
  end
end

defmodule Runner do
  use Dynamic, import: [:demo1, :sys1]

  def run do
    demo1(42)
    sys2(1, 2)
  end
end

Runner.run
