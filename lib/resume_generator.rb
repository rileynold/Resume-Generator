require 'kramdown'
require 'mustache'
require 'fileutils'

module ResumeGenerator
  class Template
    @@curpath = File.dirname( __FILE__ )

    def initialize(path_to_markdown, name)
      @path_to_markdown = path_to_markdown
      @name = name
    end

    def to_html
      Mustache.render( open( @@curpath + '/../assets/template/resume.mustache' ).read,
        :body => Kramdown::Document.new( open( @path_to_markdown ).read ).to_html.to_s,
        :name => @name )
    end
  end
end
