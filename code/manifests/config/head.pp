class dmlite::config::head (
  $enable_config  = $dmlite::params::enable_config,
  $user           = $dmlite::params::user,
  $group          = $dmlite::params::group,
  $log_level      = $dmlite::params::log_level,
  $logcomponents  = $dmlite::params::logcomponents
) inherits dmlite::params {

  Class[Dmlite::Install] -> Class[Dmlite::Config::Head]

  dmlite::create_config{"head_config":
    config_file_name => "dmlite",   # create /etc/dmlite.conf
    user             => $user,
    group            => $group,
    enable_config    => $enable_config,
    log_level        => $log_level,
    logcomponents    => $logcomponents
  }

  dmlite::create_config{"disk_config_http":
    config_file_name => "dmlite-disk",
    user             => $user,
    group            => $group,
    enable_config    => $enable_config,
    log_level        => $log_level,
    logcomponents    => $logcomponents
  }
}
