namespace :test do
	task :update => ["master:update", "ghpages:update"] do
		puts "\nProject updated!"
	end
end

namespace :site do
	task :update => [:generate] do
		puts "\nUpdating site (ftp)..."
		#sh('lftp -f bin/ftp-synch')
	end

	task :generate do
		puts "\nGenerating site (nanoc)..."
		config '/', '../Le-Torte-di-Chiara-output'
		sh 'nanoc3 compile'
	end
end


namespace :master do
	task :update => ["site:update", "ghpages:generate"] do
		puts "\nUpdating master (git)..."
		sh 'bin/git-domain.sh'
	end
end

namespace :ghpages do

	task :update => [:generate, "master:update"] do
		puts "\nUpdating ghpages (git)..."
		sh 'bin/git-ghpages.sh'
	end

	task :generate do
		puts "\nGenerating ghpages (nanoc)..."
		config '/Le-Torte-di-Chiara/', '../Le-Torte-di-Chiara-output-ghpages'
		sh 'nanoc3 compile'
	end

end
