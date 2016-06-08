# Documentation

## Example

```
ntp_timezone: 'Australia/Melbourne'
ntp_servers:
  - '0.au.pool.ntp.org'
  - '1.au.pool.ntp.org'
  - '2.au.pool.ntp.org'
  - '3.au.pool.ntp.org'
  - 'ntp.ubuntu.com'
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
ntp_timezone: 'UTC'
```

The timezone you want to configure. Valid values are based on the tz (timezone) database used by Linux
and other Unix systems. See this [page](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
to find a timezone for your region.

```
ntp_packages:
```

A list of the NTP packages to install. Each package supports all parameters from the
[apt](http://docs.ansible.com/ansible/apt_module.html) or [yum](http://docs.ansible.com/ansible/yum_module.html) modules.
If the value remains omitted, the following packages will be installed by default.

| Debian/Ubuntu          | RedHat/CentOS           |
| :--------------------- | :---------------------- |
| ntp                    | ntp                     |
| tzdata                 | tzdata                  |

```
ntp_service_name:
```

The name of the daemon under which NTP runs. Typically this can be omitted since it's automatically determined
based on the target operating system. For RedHat/CentOS this is `ntpd` and Debian/Ubuntu it's `ntp`.

```
ntp_service_state: 'started'
```

The desired NTP service state, valid values are `started`, `stopped`, `restarted` or `reloaded`.

```
ntp_service_enabled: yes
```

Whether the NTP service should start on boot, valid values are `yes`, or `no`.

```
ntp_conf_template: 'default/ntp.j2'
```

The NTP configuration template file processed by the Jinja2 templating language. Most variables
within this role are consumed by this template, if for some reason you need to offer more settings than
this template provides, you can override this value with a template of your choice.


```
ntp_drift_file: '/var/lib/ntp/ntp.drift'
```

The name and path of the drift file. This file stores the frequency offset between the system clock
running at its nominal frequency and the frequency required to remain in synchronization with UTC.

```
ntp_statistics_dir:
```

The path statistics get outputted to. If the value is left *undefined* no statistics will be generated.

```
ntp_statistics: 'loopstats peerstats clockstats'
```

The statistic types to monitor. There are 6 supported types available:
`clockstats`, `cryptostats`, `loopstats`, `peerstats`, `rawstats`, and `sysstats`.

```
ntp_file_generation_sets:
  - 'filegen loopstats file loopstats type day enable'
  - 'filegen peerstats file peerstats type day enable'
  - 'filegen clockstats file clockstats type day enable'
```

The file generation sets provide a means for handling files that are continuously growing during the
lifetime of a server. Server statistics are a typical example for such files. Generation file sets
provide access to a set of files used to store the actual data.

```
ntp_servers:
  - '0.ubuntu.pool.ntp.org'
  - '1.ubuntu.pool.ntp.org'
  - '2.ubuntu.pool.ntp.org'
  - '3.ubuntu.pool.ntp.org'
  - 'ntp.ubuntu.com'
```

The servers that will be used to synchronize the local time. In client mode the client clock can synchronize
to the remote server or local reference clock, but the remote server can never be synchronized to the
client clock. See this [page](http://www.pool.ntp.org/zone) to find servers in your region.

```
ntp_restrictions:
  - 'restrict -4 default kod notrap nomodify nopeer noquery'
  - 'restrict -6 default kod notrap nomodify nopeer noquery'
  - 'restrict 127.0.0.1'
  - 'restrict ::1'
```

The restrictions are used to control access to NTP. By default, time is exchanged with everybody, while
preventing them from adjusting the configuration. Local users may interrogate the NTP server more closely.