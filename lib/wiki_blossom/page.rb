module WikiBlossom
  class Page
    def initialize(path)
      @path = path
    end

    def name 
      if markdown?
        regex = /^([^\n]+)/m
      elsif textile?
        regex = /^h1\. ([^\n]+)/m
      else
        raise "Cannot identify the page type of: #{@path}"
      end
      content.match(regex)[1]
    end

    def content
      return @content unless @content.nil?
      @content = File.open(@path).read
    end

    def markdown?
      @path =~ /\.md$/
    end

    def textile?
      @path =~ /\.textile$/
    end
  end
end
