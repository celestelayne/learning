# Accelerating Rails with edge caching (10/16/14)

# Query caching. Not very useful
# - auto-magical with config. .. perform_caching = true
# - not cached between requests...

# Asset caching
# serve static assets from a proxy. apache or nginx (much better than rails app)
config.serve_static_assets = false # don't serve from public folder

# asset digests: fingerprint digests of files

# Enable compression
# inside app controller
config.middleware.use Rack::Deflator

# Set cdn host or where assets leave
config.action_controller.asset_host = 'some-cdn-url'

# Cache control
# maxage=2592000 => 'keep me for 30 days'
# s-maxage=2592000 => 'keep me for 30 days. only for proxies.'
# stale-while-revalidate
#   - it's ok to serve stale content while fresh content is being generated

# Vary HTTP Header
#   use on content encoding
#   what?

# Dynamic Content
# done in rails via fragment caches that are managed from views + controllers
# Nested fragments are hard. avoid

# Edge Cache
# - move data as close to user as possible (geographic distribution)
# Edge Caching dynamic content
# - set cache control headers
# - purge: remove content from cache
# - Don't cache private data (cookes), or things with a Set-Cookie key

# URL Writing
# Varnish is neat. VCL is a language for it
# Apache and Nginx can rewrite paths and filter bad requests before request reaches app stack

# ETAGS - SHA header of an asset.
# - allows browser to cache files locally (304 Not Modified)

# PS,
# Set Cache-Control http directives
# use Google PageSpeed insights chrome extension
