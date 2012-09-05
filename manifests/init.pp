class logstash {
  package { "elasticsearch":
    ensure => latest,
  }

  service { "elasticsearch" :
    ensure => running,
    enable => true, 
    hasrestart => true,
    require => Package["elasticsearch"]
  }

  package { "logstash.d":
    ensure => latest,
    require => Service["elasticsearch"],
    notify => Service["logstash"]
  }

  service { "logstash" :
    ensure => running,
    enable => true, 
    hasrestart => true,
    require => Package["logstash.d"]
  }
}
