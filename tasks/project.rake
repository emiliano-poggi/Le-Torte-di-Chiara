require 'lib/helpers.rb'

namespace :project do
	task :update => ["master:update", "ghpages:update", "site:update"] do
		puts "\n__Project updated!"
	end
end

namespace :site do
	task :update => [:generate] do
		puts "\n__Updating site (ftp)..."
		sh('lftp -f bin/ftp-synch')
	end

	task :generate do
		puts "\n__Generating site (nanoc)..."
		config '/', '../Le-Torte-di-Chiara-output'
		sh 'nanoc3 compile'
	end
end


namespace :master do
	task :update => ["site:generate", "ghpages:generate"] do
		puts "\n__Updating master (git)..."
		sh 'bin/git-domain.sh'
	end
end

namespace :ghpages do

	task :update => [:generate, "master:update"] do
		puts "\n__Updating ghpages (git)..."
		sh 'bin/git-ghpages.sh'
	end

	task :generate do
		puts "\n__Generating ghpages (nanoc)..."
		config '/Le-Torte-di-Chiara/', '../Le-Torte-di-Chiara-output-ghpages'
		sh 'nanoc3 compile'
	end

end
