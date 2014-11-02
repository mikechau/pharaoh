task :stats => "pharaoh:stats"

namespace :pharaoh do
  task :stats do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << ["Policies", "app/policies"]
  end
end
