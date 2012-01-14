module WikiBlossom
  class Wiki
    def initialize(directory)
      @directory = directory.chomp('/')
      @files = files()
      @pages = @files.map {|f| Page.new(f) }
    end

    def serve(path)
      case path
      when '', '/'
        content = index
        [200, header(content), [content]]
      when /^\/([^\/]+)\/?$/ # /segment/
        slug = $1 # resulting match of the previous regex
        status = 200
        path_without_ext = "#{@directory}/#{slug}"
        ext = if File.exist? "#{path_without_ext}.md" then 'md'
              elsif File.exist? "#{path_without_ext}.textile" then 'textile'
              else 'unknown'
              end
        path = "#{path_without_ext}.#{ext}"
        page = Page.new path
        content = case ext 
                  when 'md' then RDiscount.new(page.content).to_html
                  when 'textile' then RedCloth.new(page.content).to_html
                  when 'unknown' then status = 404; 'Not Found'
                  end
        content << "<br/><a href='txmt://open/?url=file://#{path}'>Edit with TextMate</a>"
        content = layout(page.name, content)
        [status, header(content), [content]]
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
      Dir.glob("#{@directory}/*").reject{|f| 
        File.directory?(f) 
      }
    end

    def index
      body = "<ul>" << @pages.map{|p| 
        "<li><a href='/#{p.base_name}'>#{p.name}</a></li>" 
      }.join('') << "</ul>"
      layout "Index", body
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
