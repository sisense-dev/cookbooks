# === VERSION AND LOCATION
#https://download.elastic.co/kibana/kibana/kibana-4.2.0-linux-x64.tar.gz

default['kibana']['version']       = '4.1.0-linux-x64'
# sha256 ( shasum -a 256 FILENAME )
default['kibana']['checksum']      = 'd593af567c5dd814e59fb2bc2e11a194add6caa0f58c54c82da8fb708554aded'
default['kibana']['host']          = 'http://download.elastic.co'
default['kibana']['repository']    = 'kibana/kibana'
default['kibana']['filename']      = nil
default['kibana']['download_url']  = 'https://s3.amazonaws.com/data.sisense.com/Infra/sisenseeyes/kibana.tgz'

# === DEPENDENCIES
#
default['kibana']['dependency']['install_java']          = false
default['kibana']['dependency']['install_elasticsearch'] = false

# === NAMING
#
default['kibana']['node']['name']    = node.name

# === USER & PATHS
#
default['kibana']['dir']       = '/usr/local'
default['kibana']['bindir']    = '/usr/local/bin'
default['kibana']['user']      = 'kibana'
default['kibana']['uid']       = nil
default['kibana']['gid']       = nil

default['kibana']['path']['conf'] = '/usr/local/etc/kibana'
default['kibana']['path']['logs'] = '/usr/local/var/log/kibana'

default['kibana']['pid_path']  = '/usr/local/var/run'
default['kibana']['pid_file']  = "#{node['kibana']['pid_path']}/kibana-#{node['kibana']['node']['name'].to_s.gsub(/\W/, '_')}.pid"

default['kibana']['templates']['kibana_yml'] = 'kibana.yml.erb'

# === Service
#
default['kibana']['skip_start']   = false
default['kibana']['skip_restart'] = false

# === Kibana instance configurations
#
default['kibana']['java_opts'] = '-Xms128m -Xmx128m $JAVA_OPTS'
# Kibana Host
default['kibana']['http']['host'] = '0.0.0.0'
# Kibana Port
default['kibana']['http']['port'] = 80
# The Elasticsearch instance to use
default['kibana']['elasticsearch']['server'] = 'http://localhost:9200'
# Kibana uses an index in Elasticsearch to store saved searches, visualizations
# and dashboards. It will create an new index if it doesn't already exist.
default['kibana']['elasticsearch']['index'] = '.kibana'
# The default application to load.
default['kibana']['default_app_id'] = 'discover'
# Time in seconds to wait for responses from the back end or elasticsearch.
# Note this should always be higher than "shard_timeout".
# This must be > 0
default['kibana']['request_timeout'] = '60'
# Time in milliseconds for Elasticsearch to wait for responses from shards.
# Note this should always be lower than "request_timeout".
# Set to 0 to disable (not recommended).
default['kibana']['shard_timeout'] = '30000'
# Set to false to have a complete disregard for the validity of the SSL
# certificate.
default['kibana']['verify_ssl'] = true
