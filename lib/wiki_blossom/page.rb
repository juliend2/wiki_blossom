module WikiBlossom
  class Page
    def initialize(path)
      @path = path
    end

    def markdown?
      @path =~ /\.md$/
    end

    def textile?
      @path =~ /\.textile$/
    end
  end
end
