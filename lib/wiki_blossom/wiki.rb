module WikiBlossom
  class Wiki
    def initialize
      @files = files()
      @pages = @files.each {|f| Page.new(f) }
    end

    def files
      Dir.glob('/Users/jdesrosiers/Dropbox/perso/wiki/*')
    end
  end
end
