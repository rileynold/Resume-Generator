require 'bundler/setup'
$: << "./lib"
require 'resume_generator'

task :default => :build

desc "build markdown template" 
task :build do
  resume = ResumeGenerator::Template.new( File.expand_path('assets/template/resume.md'), "Riley Nold" )
  open( 'public/index.html', 'w').write(resume.to_html)

  # copy assets
  FileUtils.cp_r( 'assets', "public/" )
end

desc "setup a webserver to preview resume"
task :preview do
  Rake::Task[:build].execute
end
