use Mix.Config

config :amqp,
       connection: [host: "127.0.0.1", port: 5672, username: "user", password: "password", virtual_host: "/vhost"]

config :lager,
       handlers: [
         level: :debug
       ]
