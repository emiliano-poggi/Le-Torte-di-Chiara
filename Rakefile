require 'rubygems'
require 'nanoc3/tasks'

namespace :site do

	def config root, output='output'
		conf = YAML.load_file('config.yaml')
		conf["site_root"]=root
		conf["output_dir"]=output
		File.open( 'config.yaml','w' ) {|f| f.write( conf.to_yaml )}
	end

	# images, com, copy
	task :update => [:domain,:ghpages]
	
	desc "Update master repo and domain"
	task :domain => [:compile_domain] do
		# import images
		sh 'bin/git-domain.sh'
		# ftp output copy
	end

	desc "Update gh-pages repo"
	task :ghpages => [:compile_ghpages] do
		sh 'bin/git-ghpages.sh'
		# git
		# cp
		# git
	end
	
	desc "Generate letortedichiara.com output"
	task :compile_domain do
		config '/', '../Le-Torte-di-Chiara-output'
		sh 'nanoc3 compile'
	end

	desc "Generate empo.github.com/Le-Torte-di-Chiara output"
	task :compile_ghpages do
		config '/Le-Torte-di-Chiara/', '../Le-Torte-di-Chiara-output-ghpages'
		sh 'nanoc3 compile'
	end

end
