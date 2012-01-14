module WikiBlossom
  class Wiki
    def initialize
      @files = files()
      @pages = @files.map {|f| Page.new(f) }
    end

    def serve(path)
      case path
      when '', '/'
        content = index
        [200, header(content), [content]]
      when /^\/[^\/]+\/?$/ # /segment/
        content = 'Joie'
        [200, header(content), [content]]
      else
        content = 'Not Found!'
        [404, header(content), [content]]
      end
    end

    def header(content)
      {
        'Content-Type' => 'text/html',
        'Content-Length' => content.size.to_s
      }
    end

    def files
      Dir.glob('/Users/jdesrosiers/Dropbox/perso/wiki/*').reject{|f| 
        File.directory?(f) 
      }
    end

    def index
      layout "Index", "<ul>" << @pages.map{|p| 
        "<li>#{p.name}</li>" 
      }.join('') << "</ul>"
    end

    def layout(title, body)
      %{<!DOCTYPE html>
        <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <title>#{title}</title>
        </head>
        <body>
          #{body}
        </body>
        </html>
      }
    end
  end
end
