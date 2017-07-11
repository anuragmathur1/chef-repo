bash "es-template" do
  code <<-EOH
    curl -XPOST -u elastic:changeme http://#{node['elasticsearch']['hostname']}:9200/_template/logstashtemplate  \
    -d '{ "template" : "logstash-*", \
    "mappings" : { "app" : { "numeric_detection": true  }, \
    "apache_error" : { "numeric_detection": true }, \
    "apache_access" : { "numeric_detection": true } } }'
  EOH
end


bash 'create-es-watcher' do
  code <<-EOH
  curl -XPUT -u elastic http://#{node['elasticsearch']['hostname']}:9200/_xpack/watcher/watch/log_error -d'{ \
  "trigger" : { \
    "schedule" : { "interval" : "5m" } \
  }, \
  "input": { \
    "search": { \
      "request": { \
        "indices": ["logstash-*"], \
        "body" : { \
          "query" :{ \
            "bool" : { \
               "must" : { \
                "match": { \
                  "level": "500" \
                } \
              }, \
              "filter" : { \
                "range": { \
                  "@timestamp": { \
                  "from": "{{ctx.trigger.scheduled_time}}||-5m", \
                  "to": "{{ctx.trigger.triggered_time}}" \
                  } \
                } \
              } \
            } \
          } \
        } \
      } \
    } \
  }, \
  "condition": { \
    "compare": { \
      "ctx.payload.hits.total": { \
        "gt": 0 \
      } \
    } \
  }, \
  "actions": { \
    "send_email": { \
      "email": { \
        "to": "tony.xu@elmolearning.com.au", \
        "subject": "Elmo Error logs", \
        "body": "Elmo Error Logs", \
        "attach_data": true \
      } \
    } \
    "notify-slack" : { \
      "throttle_period" : "5m", \
      "slack" : { \
        "account" : "elmoteam", \
        "message" : { \
          "from" : "watcher", \
          "to" : [ "#general" ], \
          "text" : "ELMO System Monitoring", \
          "attachments" : [ \
            { \
            "title" : "Errors Found", \
            "text" : "Encountered  {{ctx.payload.hits.total}} errors in the last 5 minutes.", \
            "color" : "danger" \
            } \
          ] \
        } \
      } \
    } \
  } \
}'
EOH
end
