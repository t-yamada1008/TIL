class KeTexProcessor
  def initialize(document)
    @document = document
  end

  def process
    # Hypothetical processing of KeTex document
    puts "Processing KeTex document..."
    puts @document
  end
end

document = "
\\begin{document}
\\title{Sample KeTex Document}
\\author{John Doe}
\\date{July 2024}
\\maketitle

\\section{Introduction}
This is a sample document created with KeTex.

\\section{Mathematics}
Here is a sample equation:
\\begin{equation}
E = mc^2
\\end{equation}

\\end{document}
"

processor = KeTexProcessor.new(document)
processor.process
