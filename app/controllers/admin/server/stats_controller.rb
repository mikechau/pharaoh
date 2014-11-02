class Admin::Server::StatsController < Admin::BaseController
  add_breadcrumb 'Admin', :admin_root_path

  def index
    add_breadcrumb 'Passenger', :admin_server_stats_path

    @status = `passenger-status`
    @memory = `passenger-memory-stats`
  end

  def processes
    add_breadcrumb 'Processes', :processes_admin_server_stats_path

    @processes = `ps aux --sort -rss`
  end
end